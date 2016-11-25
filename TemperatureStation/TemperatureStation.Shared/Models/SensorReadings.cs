using System;
using System.Collections.Generic;

namespace TemperatureStation.Shared.Models
{
    public class SensorReadings
    {
        public DateTime ReadingTime = DateTime.Now;
        public List<SensorReading> Readings = new List<SensorReading>();

        public override string ToString()
        {
            var asString = "";

            if(Readings != null)
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