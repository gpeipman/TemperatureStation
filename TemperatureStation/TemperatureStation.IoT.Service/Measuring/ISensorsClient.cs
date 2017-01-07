using TemperatureStation.IoT.Service.Models;

namespace TemperatureStation.IoT.Service.Measuring
{
    internal interface ISensorsClient
    {
        SensorReadings ReadSensors();
        string[] ListSensors();
    }
}
