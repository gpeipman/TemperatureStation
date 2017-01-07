using System;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.Devices.Client;
using Newtonsoft.Json;
using TemperatureStation.IoT.Service.Models;

namespace TemperatureStation.IoT.Service.Reporting
{
    internal class AzureIotHubReportingClient : IReportingClient
    {
        private const string IotHubUri = "uri";
        private const string DeviceId = "id";
        private const string DeviceKey = "key";
        private DeviceClient _deviceClient;

        public AzureIotHubReportingClient()
        {
            var auth = new DeviceAuthenticationWithRegistrySymmetricKey(DeviceId, DeviceKey);
            _deviceClient = DeviceClient.Create(IotHubUri, auth, TransportType.Http1);
        }

        public bool SupportsSensorsUpdate
        {
            get { return false; }
        }

        public async Task ReportReadings(SensorReadings readings)
        {
            var messageString = JsonConvert.SerializeObject(readings);
            var message = new Message(Encoding.ASCII.GetBytes(messageString));

            await _deviceClient.SendEventAsync(message);
        }

        public Task UpdateSensors(string[] sensorIds)
        {
            throw new NotSupportedException();
        }
    }
}
