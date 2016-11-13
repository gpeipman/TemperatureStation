using System;
using System.Collections.Generic;

namespace TemperatureStation.Shared.Models
{
    internal class SensorReadings
    {
        public DateTime ReadingTime = DateTime.Now;
        public List<SensorReading> Readings = new List<SensorReading>();
    }
}
