using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data.Queries;
using TemperatureStation.Web.Extensions;
using TemperatureStation.Web.Models;

namespace TemperatureStation.Web.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Reading>()
                   .HasDiscriminator<string>("ReadingType")
                   .HasValue<SensorReading>("SE")
                   .HasValue<CalculatorReading>("CA");

            builder.Entity<ApplicationUser>()
                   .HasMany(e => e.Roles)
                   .WithOne()
                   .HasForeignKey(e => e.UserId)
                   .IsRequired()
                   .OnDelete(DeleteBehavior.Cascade);
        }

        public DbSet<Sensor> Sensors { get; set; }
        public DbSet<Measurement> Measurements { get; set; }
        public DbSet<SensorRole> SensorRoles { get; set; }
        public DbSet<Reading> Readings { get; set; }
        public DbSet<CalculatorReading> CalculatorReadings { get; set; }
        public DbSet<SensorReading> SensorReadings { get; set; }
        public DbSet<Calculator> Calculators { get; set; }
        public DbSet<MeasurementStats> MeasurementStats { get; set; }

        public IList<IGrouping<DateTime, ReadingViewModel>> GetReadings(ReadingsQuery query)
        {
            return GetReadingsPaged(query).Results;
        }

        public PagedResult<IGrouping<DateTime, ReadingViewModel>> GetReadingsPaged(ReadingsQuery query)
        {
            var datesPaged = Readings.Where(r => r.Measurement.Id == query.MeasurementId &&
                                            (query.FromTime == null || r.ReadingTime >= query.FromTime) &&
                                            (query.ToTime == null || r.ReadingTime <= query.ToTime) &&
                                            (query.NewerThan == null || r.ReadingTime > query.NewerThan))
                                 .OrderByIf(r => r.ReadingTime, () => query.Ascending)
                                 .Select(r => r.ReadingTime)
                                 .Distinct()
                                 .GetPaged(query.Page, query.PageSize);
            var dates = datesPaged.Results;

            // Make sure readings get SensorRole and Calculator loaded automatically
            // It's practically caching them for grouping query
            var measurement = Measurements.Include(m => m.SensorRoles)
                                          .Include(m => m.Calculators)
                                          .FirstOrDefault(m => m.Id == query.MeasurementId);

            var grouped = Readings.Where(r =>
                                            (r.Measurement.Id == query.MeasurementId)
                                            && (dates == null || dates.Contains(r.ReadingTime))
                                            )
                                    .OrderByIf(r => r.ReadingTime, () => query.Ascending)
                                    .OrderBy(r => r.Name)
                                    .ToList()
                                    .AsQueryable()
                                    .ProjectTo<ReadingViewModel>()
                                    .GroupBy(r => r.ReadingTime)
                                    .ToList();

            var result = new PagedResult<IGrouping<DateTime, ReadingViewModel>>();
            result.CurrentPage = datesPaged.CurrentPage;
            result.PageCount = datesPaged.PageCount;
            result.PageSize = datesPaged.PageSize;
            result.RowCount = datesPaged.RowCount;
            result.Results = grouped;

            return result;
        }
    }
}
