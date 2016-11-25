using System;

namespace TemperatureStation.Web.Models
{
    public class ReadingViewModel
    {
        public int Id { get; set; }
        public DateTime ReadingTime { get; set; }
        public double Value { get; set; }
        public string SensorRoleRoleName { get; set; }
    }
}
