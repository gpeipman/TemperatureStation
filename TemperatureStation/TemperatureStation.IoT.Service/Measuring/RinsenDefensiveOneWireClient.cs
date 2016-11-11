using System;
using System.Collections.Generic;
using System.Linq;
using Rinsen.IoT.OneWire;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Measuring
{
    internal class RinsenDefensiveOneWireClient : ISensorsClient, IDisposable
    {
        private readonly OneWireDeviceHandler _handler;
        private IEnumerable<DS18B20> _devices;
        private DateTime _previousReadingTime;

        public RinsenDefensiveOneWireClient()
        {
            _handler = new OneWireDeviceHandler();
        }

        public SensorReadings ReadSensors()
        {
            if (_devices == null)
            {
                _devices = _handler.GetDevices<DS18B20>();
            }

            var secondsFromLastReading = (DateTime.Now - _previousReadingTime).TotalSeconds;
            if(secondsFromLastReading <= _devices.Count() * 2)
            {
                return null;
            }

            _previousReadingTime = DateTime.Now;

            var result = new SensorReadings();
            result.ReadingTime = _previousReadingTime;

            foreach (var device in _devices)
            {
                var reading = new SensorReading();
                reading.SensorId = device.OneWireAddressString;
                reading.Reading = device.GetTemperature();

                result.Readings.Add(reading);
            }

            return result;
        }

        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    _handler.Dispose();
                }

                disposedValue = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
        }
        #endregion
    }
}
