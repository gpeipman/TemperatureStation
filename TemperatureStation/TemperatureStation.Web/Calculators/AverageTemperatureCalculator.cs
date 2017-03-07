using System.Linq;
using TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Calculators
{
    [Calculator(Name = "Average temperature", Order = 1000)]
    public class AverageTemperatureCalculator : ICalculator
    {
        public bool ReturnsReading
        {
            get { return true; }
        }

        public double Calculate(SensorReadings readings, Measurement measurement)
        {
            return readings.Readings.Average(r => r.Reading);
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
