using System;
using System.Collections.Generic;
using Rinsen.IoT.OneWire;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.IoT.Service.Measuring
{
    internal class RinsenOneWireClient : ISensorsClient, IDisposable
    {
        private readonly OneWireDeviceHandler _handler;
        private IEnumerable<DS18B20> _devices;

        public RinsenOneWireClient()
        {
            _handler = new OneWireDeviceHandler();
        }

        public SensorReadings ReadSensors()
        {
            if (_devices == null)
            {
                _devices = _handler.GetDevices<DS18B20>();
            }

            var result = new SensorReadings();
            result.ReadingTime = DateTime.Now;

            foreach(var device in _devices)
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
