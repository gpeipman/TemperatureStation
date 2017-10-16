using System;
using System.Threading.Tasks;
using Windows.Storage;

namespace TemperatureStation.IoT.Service.Logging
{
    internal class FileLogger : ILogger
    {
        public void Critical(string message)
        {
            Write("CRITICAL: " + message).Wait();
        }

        public void Debug(string message)
        {
            Write("DEBUG: " + message).Wait();
        }

        public void Error(string message)
        {
            Write("ERROR: " + message).Wait();
        }

        public void Info(string message)
        {
            Write("INFO: " + message).Wait();
        }

        public void Warn(string message)
        {
            Write("WARNING: " + message).Wait();
        }

        private async Task Write(string message)
        {
            var storageFolder = ApplicationData.Current.LocalFolder;
            var file = await storageFolder.CreateFileAsync("temperature-station-log.txt", CreationCollisionOption.OpenIfExists);
            await FileIO.AppendTextAsync(file, DateTime.Now + " " + message + "\r\n");
        }
    }
}
