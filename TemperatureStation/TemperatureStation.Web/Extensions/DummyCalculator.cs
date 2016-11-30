using System;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Dummy calculator")]
    public class DummyCalculator : ICalculator
    {
        public void Calculate(SensorReadings readings)
        {
            throw new NotImplementedException();
        }
    }
}
