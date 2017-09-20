using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
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
            var cstr = this.Database.GetDbConnection().ConnectionString;
            base.OnModelCreating(builder);

            builder.Entity<Reading>()
                   .HasDiscriminator<string>("ReadingType")
                   .HasValue<SensorReading>("SE")
                   .HasValue<CalculatorReading>("CA");
        }

        public DbSet<Sensor> Sensors { get; set; }
        public DbSet<Measurement> Measurements { get; set; }
        public DbSet<SensorRole> SensorRoles { get; set; }
        public DbSet<Reading> Readings { get; set; }
        public DbSet<CalculatorReading> CalculatorReadings { get; set; }
        public DbSet<SensorReading> SensorReadings { get; set; }
        public DbSet<Calculator> Calculators { get; set; }
    }
}
