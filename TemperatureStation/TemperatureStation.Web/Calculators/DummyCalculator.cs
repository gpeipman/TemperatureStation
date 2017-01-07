using System;
using System.Linq;
using TemperatureStation.Web.Data;
using SharedModels = TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Calculators
{
    [Calculator(Name = "Dummy calculator", Order = 1000)]
    public class DummyCalculator : ICalculator
    {
        private readonly ApplicationDbContext _dataContext;

        public DummyCalculator(ApplicationDbContext dataContext)
        {
            _dataContext = dataContext;
        }

        public bool ReturnsReading
        {
            get { return true; }
        }

        public double Calculate(SharedModels.SensorReadings readings, Measurement measurement)
        {
            return readings.Readings.First().Reading + 10f;
        }

        public string DisplayValue(double value)
        {
            return value.ToString();
        }

        public void SetParameters(string parameters)
        {
        }
    }
}
