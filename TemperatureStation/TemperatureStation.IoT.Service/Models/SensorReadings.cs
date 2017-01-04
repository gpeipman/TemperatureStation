using System;
using System.Collections.Generic;

namespace TemperatureStation.IoT.Service.Models
{
    internal class SensorReadings
    {
        public DateTime ReadingTime { get; set; }
        public List<SensorReading> Readings { get; set; }

        public SensorReadings()
        {
            ReadingTime = DateTime.Now;
            Readings = new List<SensorReading>();
        }
    }
}
