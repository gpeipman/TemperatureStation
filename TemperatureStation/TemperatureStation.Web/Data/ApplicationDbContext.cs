using System;
using System.Linq;
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

        public PagedResult<IGrouping<DateTime, Reading>> GetReadings(ReadingsQuery query)
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

            var readings1 = SensorReadings
                                .Where(r =>
                                        (r.Measurement.Id == query.MeasurementId)
                                        && (dates == null || dates.Contains(r.ReadingTime))
                                        )
                                .OrderByIf(r => r.ReadingTime, () => query.Ascending)
                                .Select(r => (Reading)r)
                                .ToList();

            var readings2 = CalculatorReadings
                                .Where(r =>
                                        (r.Measurement.Id == query.MeasurementId)
                                        && (dates == null || dates.Contains(r.ReadingTime))
                                        )
                                .OrderByIf(r => r.ReadingTime, () => query.Ascending)
                                .Select(r => (Reading)r)
                                .ToList();

            readings1.AddRange(readings2);
            readings1 = readings1.AsQueryable()
                                 .OrderByIf(r => r.ReadingTime, () => query.Ascending)
                                 //.OrderByDescending(r => r.ReadingTime)
                                 .OrderBy(r => r.Name)
                                 .ToList();

            var grouped = readings1.AsQueryable()
                                   .OrderByIf(r => r.ReadingTime, () => query.Ascending)
                                   //.OrderBy(r => r.ReadingTime)
                                   .GroupBy(r => r.ReadingTime)
                                   .ToList();

            var result = new PagedResult<IGrouping<DateTime, Reading>>();
            result.CurrentPage = datesPaged.CurrentPage;
            result.PageCount = datesPaged.PageCount;
            result.PageSize = datesPaged.PageSize;
            result.RowCount = datesPaged.RowCount;
            result.Results = grouped;

            return result;
        }
    }
}
