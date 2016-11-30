using System;
using SharedModels = TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Heat Exchange Rate")]
    public class HeatExchangeRateCalculator : ICalculator
    {
        public bool NeedsPreviousReading
        {
            get { return true; }
        }

        public string[] SensorInputs
        {
            get
            {
                return new string[] { "Ambient temperature", "Liquid temperature" };
            }
        }

        public float Calculate(SharedModels.SensorReadings readings, Calculator calculatorDefiniton)
        {
            throw new NotImplementedException();
        }
    }
}
