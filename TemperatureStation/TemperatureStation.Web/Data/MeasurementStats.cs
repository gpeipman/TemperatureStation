using System;
using System.ComponentModel.DataAnnotations;

namespace TemperatureStation.Web.Data
{
    public class MeasurementStats
    {
        [Key]
        public Guid Id { get; set; }
        public int MeasurementId { get; set; }
        public string Name { get; set; }
        public double Min { get; set; }
        public double Max { get; set; }
    }
}
