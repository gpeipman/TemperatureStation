using System;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Heat Exchange Rate")]
    public class HeatExchangeRateCalculator : ICalculator
    {
        public bool NeedsPreviousReading
        {
            get { return true; }
        }

        public float Calculate(SensorReadings readings, SensorReading previousReadings)
        {
            throw new NotImplementedException();
        }
    }
}
