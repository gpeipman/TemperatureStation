using TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
{
    public interface ICalculator
    {
        void Calculate(SensorReadings readings);
    }
}
