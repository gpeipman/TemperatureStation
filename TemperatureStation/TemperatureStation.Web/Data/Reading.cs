using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemperatureStation.Web.Data
{
    public class Reading
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public DateTime ReadingTime { get; set; }

        public double Value { get; set; }

        public SensorRoleInMeasurement SensorRole { get; set; }
    }
}
