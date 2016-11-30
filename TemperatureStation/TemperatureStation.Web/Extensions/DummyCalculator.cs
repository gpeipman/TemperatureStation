using System;
using SharedModels = TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

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

        public string[] SensorInputs
        {
            get
            {
                return new string[] { };
            }
        }

        public float Calculate(SharedModels.SensorReadings readings, Calculator calculatorDefiniton)
        {
            throw new NotImplementedException();
        }
    }
}
