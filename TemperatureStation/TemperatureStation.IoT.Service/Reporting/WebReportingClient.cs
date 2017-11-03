using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TemperatureStation.IoT.Service.Logging;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Reporting
{
    internal class WebReportingClient : IReportingClient
    {
        private const string ServiceAddress = "http://192.168.1.2:8081/api/";
        private const string DeviceKey = "LongAndComplexKey";

        private ILogger _logger;

        public WebReportingClient(ILogger logger)
        {
            _logger = logger;
        }

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
                _logger.Info("Web reporting client: " + body);
                var content = new StringContent(body, Encoding.UTF8, "application/json");

                var response = await client.PostAsync(url, content);
                body = "";

                if(response.Content != null)
                {
                    body = await response.Content.ReadAsStringAsync();
                }

                _logger.Info("Web reporting client: " + response.StatusCode + " " + body);
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