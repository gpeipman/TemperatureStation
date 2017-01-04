using System.Threading.Tasks;
using TemperatureStation.IoT.Service.Models;

namespace TemperatureStation.IoT.Service.Reporting
{
    internal interface IReportingClient
    {
        Task ReportReadings(SensorReadings readings);
        Task UpdateSensors(string[] sensorIds);
        bool SupportsSensorsUpdate { get; }
    }
}
