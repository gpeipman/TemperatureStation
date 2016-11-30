using TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
{
    public interface ICalculator
    {
        float Calculate(SensorReadings readings, SensorReading previousReadings);
        bool NeedsPreviousReading { get; }
    }
}
