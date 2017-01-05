using System;
using System.Linq;
using TemperatureStation.Web.Data;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Freezing estimate calculator", Order = 2, ShowOnChart = false, DisplayLabel = "Freezing estimate")]
    public class FreezingEstimateCalculator : ICalculator
    {
        private string _ambientSensorId;
        private string _liquidSensorId;

        public bool ReturnsReading
        {
            get { return true; }
        }

        public double Calculate(SensorReadings readings, Measurement measurement)
        {
            if(measurement == null)
            {
                throw new ArgumentNullException(nameof(measurement));
            }

            if(measurement.FreezingPoint == null)
            {
                return -1.0;
            }

            if(measurement.CoolingRate == null)
            {
                return -1.0;
            }

            var ambientSensorId = measurement.SensorRoles
                                             .FirstOrDefault(r => r.RoleName == _ambientSensorId)
                                             .Sensor
                                             .Id;
            var liquidSensorId  = measurement.SensorRoles
                                             .FirstOrDefault(r => r.RoleName == _liquidSensorId)
                                             .Sensor
                                             .Id;

            var ambientTemp = readings.GetSensorReading(ambientSensorId);
            if(ambientTemp == null)
            {
                return -1.0;
            }

            var liquidTemp = readings.GetSensorReading(liquidSensorId);
            if(liquidTemp == null)
            {
                return -1.0;
            }

            var estimate = GetCoolingEstimate(liquidTemp.Value, 
                                              ambientTemp.Value, 
                                              measurement.FreezingPoint.Value, 
                                              measurement.CoolingRate.Value);

            if(double.IsNaN(estimate) || double.IsInfinity(estimate))
            {
                estimate = -1;
            }

            return Math.Ceiling(estimate);
        }
        private static double GetCoolingEstimate(double T0, double Ta, double Tt, double k)
        {
            var d1 = T0 - Ta;
            var d2 = Tt - Ta;

            if (d2 == 0 || k == 0)
                return -1;

            return Math.Log(d1 / d2) / k;
        }

        public void SetParameters(string parameters)
        {
            var parts = parameters.Split(";".ToCharArray());
            _ambientSensorId = parts[0];
            _liquidSensorId = parts[1];
        }

        public string DisplayValue(double value)
        {
            if(value < 0)
            {
                return "-";
            }

            var span = TimeSpan.FromMinutes(value);
            if(span.Days < 1)
            {
                return span.ToString("hh\\:mm");
            }

            return span.ToString("d\\.hh\\:mm");
        }
    }
}
