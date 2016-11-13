using System;
using System.Collections.Generic;

namespace TemperatureStation.Shared.Models
{
    public sealed class SensorReadings
    {
        public DateTime ReadingTime = DateTime.Now;
        public List<SensorReading> Readings = new List<SensorReading>();
    }
}
