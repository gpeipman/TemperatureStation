using System;
using System.Linq;
using TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Theoretical temperature calculator", Order = 3, ShowOnChart = true, DisplayLabel = "Theoretical temperature")]
    public class TheoreticalTemperatureCalculator : ICalculator
    {
        private string _ambientSensorId;
        private string _liquidSensorId;

        private readonly ApplicationDbContext _dataContext;
        
        public TheoreticalTemperatureCalculator(ApplicationDbContext dataContext)
        {
            _dataContext = dataContext;
        }

        public bool ReturnsReading
        {
            get
            {
                return true;
            }
        }

        public double Calculate(SensorReadings readings, Measurement measurement)
        {
            if (measurement.CoolingRate == null)
            {
                return -100;
            }

            var ambientSensorId = measurement.SensorRoles
                                             .FirstOrDefault(r => r.RoleName == _ambientSensorId)
                                             .Sensor
                                             .Id;
            var liquidSensorId = measurement.SensorRoles
                                             .FirstOrDefault(r => r.RoleName == _liquidSensorId)
                                             .Sensor
                                             .Id;

            var ambientTemp = readings.GetSensorReading(ambientSensorId);
            if (ambientTemp == null)
            {
                return -100;
            }

            var liquidTemp = readings.GetSensorReading(liquidSensorId);
            if (liquidTemp == null)
            {
                return -100;
            }

            var oldestTime = GetOldestSameAmbientTemperature(ambientTemp.Value, measurement.Id);
            if(oldestTime == null)
            {
                return -100;
            }

            var time = readings.ReadingTime - oldestTime.Value;
            var temp = GetTheoreticalTemperature(time.TotalMinutes, 
                                                 liquidTemp.Value, 
                                                 ambientTemp.Value,
                                                 measurement.CoolingRate.Value);

            if(double.IsNaN(temp) || double.IsInfinity(temp))
            {
                return -100;
            }

            return temp;
        }

        private double GetTheoreticalTemperature(double minutes, double liquid, double ambient, double k)
        {
            return ambient + (liquid - ambient) * Math.Pow(Math.E, -1 * k * minutes);
        }

        public string DisplayValue(double value)
        {
            return value.ToString();
        }

        public void SetParameters(string parameters)
        {
            var parts = parameters.Split(";".ToCharArray());
            _ambientSensorId = parts[0];
            _liquidSensorId = parts[1];
        }

        private DateTime? GetOldestSameAmbientTemperature(double t, int measurementId)
        {
            double? prevTemperature = t;
            DateTime? oldestTime = null;

            while (prevTemperature.HasValue)
            {
                var reading = _dataContext.SensorReadings
                                        .Where(r => r.Measurement.Id == measurementId
                                                    && r.SensorRole.RoleName == _ambientSensorId
                                                    && (oldestTime == null || r.ReadingTime < oldestTime))
                                        .OrderByDescending(r => r.ReadingTime)
                                        .FirstOrDefault();

                if(reading == null || reading.Value != t)
                {
                    break;
                }

                oldestTime = reading.ReadingTime;
            }

            return oldestTime;
        }
    }
}
