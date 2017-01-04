using System.Linq;
using TemperatureStation.Web.Data;
using SharedModels = TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
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

        public float Calculate(SharedModels.SensorReadings readings, Measurement measurement)
        {
            return (float)readings.Readings.First().Reading + 10f;
        }

        public void SetParameters(string parameters)
        {
        }
    }
}
