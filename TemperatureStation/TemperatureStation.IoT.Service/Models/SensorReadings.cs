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

        public override string ToString()
        {
            var asString = "";

            if (Readings != null)
                foreach (var reading in Readings)
                {
                    asString += ", " + reading.SensorId + ": " + reading.Reading;
                }

            if (asString.StartsWith(","))
            {
                asString = asString.Substring(1);
            }

            asString = ReadingTime + ": " + asString;

            return asString;
        }
    }
}
