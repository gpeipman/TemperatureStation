using System;
using System.Linq;
using SharedModels = TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Extensions;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Heat Exchange Rate")]
    public class HeatExchangeRateCalculator : ICalculator
    {
        private readonly ApplicationDbContext _dataContext;
        private string _ambientSensorId;
        private string _liquidSensorId;
        
        public HeatExchangeRateCalculator(ApplicationDbContext dataContext)
        {
            _dataContext = dataContext;
        }

        public bool ReturnsReading
        {
            get { return false; }
        }

        public float Calculate(SharedModels.SensorReadings readings, Measurement measurement)
        {
            if (measurement == null)
            {
                return -1000;
            }

            if (measurement.CoolingRate.HasValue)
            {
                return -1000;
            }

            var readingTime = (DateTime)readings.ReadingTime;
            var previousAmbientReading = _dataContext.SensorReadings                   
                                                     .Where(r => r.SensorRole.RoleName == _ambientSensorId &&
                                                                 r.Measurement.Id == measurement.Id &&
                                                                 r.ReadingTime < readingTime)
                                                     .OrderByDescending(r => r.ReadingTime)
                                                     .Take(1)
                                                     .FirstOrDefault();
            if(previousAmbientReading == null)
            {
                return -1000;
            }

            var previousLiquidReading = _dataContext.SensorReadings
                                                    .Where(r => r.SensorRole.RoleName == _liquidSensorId &&
                                                                 r.Measurement.Id == measurement.Id &&
                                                                 r.ReadingTime < readingTime)
                                                     .OrderByDescending(r => r.ReadingTime)
                                                     .Take(1)          
                                                     .Select(r => new { SensorId = r.SensorRole.Sensor.Id, Reading = r })                                           
                                                     .FirstOrDefault();
            if(previousLiquidReading == null)
            {
                return -1000;
            }
            
            var currentLiquidReading = readings.Readings.FirstOrDefault(r => r.SensorId == previousLiquidReading.SensorId);
            var delta = (readings.ReadingTime - previousLiquidReading.Reading.ReadingTime).TotalMinutes;

            var coolingRate = GetCoolingRate(previousLiquidReading.Reading.Value,
                                             previousAmbientReading.Value,
                                             currentLiquidReading.Reading,
                                             delta);

            measurement.CoolingRate = (float)coolingRate;

            return -1000;
        }

        public void SetParameters(string parameters)
        {
            var parts = parameters.Split(";".ToCharArray());
            _ambientSensorId = parts[0];
            _liquidSensorId = parts[1];
        }

        private double GetCoolingRate(double T0, double Ta, double Tt, double t)
        {
            var d1 = T0 - Ta;
            var d2 = Tt - Ta;

            if (d2 == 0 || t == 0)
                return 0;

            return Math.Log(d1 / d2) / t;
        }
    }
}
