using System;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Dummy calculator")]
    public class DummyCalculator : ICalculator
    {
        public bool NeedsPreviousReading
        {
            get
            {
                return false;
            }
        }

        public float Calculate(SensorReadings readings, SensorReading previousReadings)
        {
            return 1;
        }
    }
}
