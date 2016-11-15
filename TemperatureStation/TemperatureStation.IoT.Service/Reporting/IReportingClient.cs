using System.Threading.Tasks;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Reporting
{
    internal interface IReportingClient
    {
        Task ReportReadings(SensorReadings readings);
        Task UpdateSensors(string[] sensorIds);
    }
}
