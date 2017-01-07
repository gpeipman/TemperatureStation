using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Measuring
{
    internal interface ISensorsClient
    {
        SensorReadings ReadSensors();
        string[] ListSensors();
    }
}
