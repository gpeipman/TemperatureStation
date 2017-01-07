using TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Extensions
{
    public interface ICalculator
    {
        double Calculate(SensorReadings readings, Measurement measurement);
        string DisplayValue(double value);
        bool ReturnsReading { get; }
        void SetParameters(string parameters);
    }
}
