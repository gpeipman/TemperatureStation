using System.Net;
using System.Net.Sockets;
using System.Text;

namespace TemperatureStation.IoT.Service.Logging
{
    internal class SyslogLogger : ILogger
    {
        private const string SyslogClientName = "TemperatureStation";
        private const string SyslogHost = "192.168.1.2";
        private const int SyslogPort = 514;
        private const int SyslogFacility = 16;

        public void Critical(string message)
        {
            Send(SyslogLogLevel.Critical, message);
        }

        public void Debug(string message)
        {
            Send(SyslogLogLevel.Debug, message);
        }

        public void Error(string message)
        {
            Send(SyslogLogLevel.Error, message);
        }

        public void Info(string message)
        {
            Send(SyslogLogLevel.Info, message);
        }

        public void Warn(string message)
        {
            Send(SyslogLogLevel.Warn, message);
        }

        internal static void Send(SyslogLogLevel logLevel, string message)
        {
            if (string.IsNullOrWhiteSpace(SyslogHost) || SyslogPort <= 0)
            {
                return;
            }

            var hostName = Dns.GetHostName();
            var level = SyslogFacility * 8 + (int)logLevel;
            var logMessage = string.Format("<{0}>{1} {2}", level, hostName, message);
            var bytes = Encoding.UTF8.GetBytes(logMessage);
            
            using (var client = new UdpClient())
            {
                client.SendAsync(bytes, bytes.Length, SyslogHost, SyslogPort)
                      .Wait();
            }
        }
    }
}
