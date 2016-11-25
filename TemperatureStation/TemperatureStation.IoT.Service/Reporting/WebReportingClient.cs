using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Reporting
{
    internal class WebReportingClient : IReportingClient
    {
        private const string ServiceAddress = "http://metalcenter:8081/api/";
        private const string DeviceKey = "LongAndComplexKey";

        public bool SupportsSensorsUpdate
        {
            get { return true; }
        }

        public async Task ReportReadings(SensorReadings readings)
        {
            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("DeviceKey", DeviceKey);

                var url = ServiceAddress + "report";
                var body = JsonConvert.SerializeObject(readings);
                var content = new StringContent(body, Encoding.UTF8, "application/json");
                await client.PostAsync(url, content);
            }            
        }

        public async Task UpdateSensors(string[] sensorIds)
        {
            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("DeviceKey", DeviceKey);

                var url = ServiceAddress + "UpdateSensors";
                var body = JsonConvert.SerializeObject(sensorIds);
                var content = new StringContent(body, Encoding.UTF8, "application/json");
                await client.PostAsync(url, content);
            }
        }
    }
}