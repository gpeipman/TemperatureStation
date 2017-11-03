using System;
using System.Collections.Generic;
using System.Linq;

namespace TemperatureStation.Shared.Models
{
    public class SensorReadings
    {
        public DateTime ReadingTime = DateTime.Now;
        public List<SensorReading> Readings = new List<SensorReading>();

        public double? GetSensorReading(string sensorId)
        {
            return Readings?.FirstOrDefault(r => r.SensorId == sensorId)?.Reading;
        }

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