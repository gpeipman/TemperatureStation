using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Reporting
{
    internal interface IReportingClient
    {
        void ReportReadings(SensorReadings readings);
    }
}
