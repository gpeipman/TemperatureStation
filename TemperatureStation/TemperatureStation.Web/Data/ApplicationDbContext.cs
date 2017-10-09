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
            var dates = Readings.Where(r => r.Measurement.Id == query.MeasurementId &&
                                            (query.FromTime == null || r.ReadingTime >= query.FromTime) &&
                                            (query.ToTime == null || r.ReadingTime <= query.ToTime))
                                .Select(r => r.ReadingTime)
                                .Distinct()
                                .ToList();

            return null;
        }
    }
}
