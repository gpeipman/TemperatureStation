using System;

namespace TemperatureStation.Web.Models
{
    public class ReadingViewModel
    {
        public int Id { get; set; }
        public DateTime ReadingTime { get; set; }
        public decimal Value { get; set; }
        public string Source { get; set; }
    }
}
