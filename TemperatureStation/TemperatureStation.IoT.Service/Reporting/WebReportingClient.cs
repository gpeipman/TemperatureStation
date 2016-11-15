using System;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Reporting
{
    internal class WebReportingClient : IReportingClient
    {
        private const string ServiceAddress = "http://server/api/";

        public void ReportReadings(SensorReadings readings)
        {
            throw new NotImplementedException();

            using (var client = new HttpClient())
            {
                var url = ServiceAddress + "report";
                var body = JsonConvert.SerializeObject(readings);
                var content = new StringContent(body, Encoding.UTF8, "application/json");
                var response = client.PostAsync(url, content);
            }            
        }

        public void UpdateSensors(string[] sensorIds)
        {
            throw new NotImplementedException();

            using (var client = new HttpClient())
            {
                var url = ServiceAddress + "UpdateSensors";
                var body = JsonConvert.SerializeObject(sensorIds);
                var content = new StringContent(body, Encoding.UTF8, "application/json");
                var response = client.PostAsync(url, content);
            }
        }
    }
}