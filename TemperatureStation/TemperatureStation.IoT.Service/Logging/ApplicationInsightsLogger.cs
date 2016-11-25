using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.DataContracts;

namespace TemperatureStation.IoT.Service.Logging
{
    internal class ApplicationInsightsLogger : ILogger
    {
        private const string InstrumentationKey = "key";

        private readonly TelemetryClient _client = new TelemetryClient();

        public ApplicationInsightsLogger()
        {
            _client.InstrumentationKey = InstrumentationKey;
        }

        public void Critical(string message)
        {
            _client.TrackTrace(message, SeverityLevel.Critical);
        }

        public void Debug(string message)
        {
            _client.TrackTrace(message, SeverityLevel.Verbose);
        }

        public void Error(string message)
        {
            _client.TrackTrace(message, SeverityLevel.Error);
        }

        public void Info(string message)
        {
            _client.TrackTrace(message, SeverityLevel.Information);
        }

        public void Warn(string message)
        {
            _client.TrackTrace(message, SeverityLevel.Warning);
        }
    }
}
