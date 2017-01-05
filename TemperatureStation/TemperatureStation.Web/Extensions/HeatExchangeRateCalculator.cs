using System;
using System.Linq;
using TemperatureStation.Web.Data;
using SharedModels = TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Heat Exchange Rate", Order = 1, ShowOnChart = false)]
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

        public double Calculate(SharedModels.SensorReadings readings, Measurement measurement)
        {
            if (measurement == null)
            {
                return -1000;
            }

            if (measurement.CoolingRate.HasValue)
            {
                return -1000;
            }            

            var readingTime = readings.ReadingTime;
            var previousAmbientReading = GetPreviousAmbientReading(measurement.Id, readingTime);
            if (previousAmbientReading == null)
            {
                return -1000;
            }
            
            double? currentAmbientReading = readings.GetSensorReading(previousAmbientReading.SensorId);
            if (currentAmbientReading == null)
            {
                return -1000;
            }

            readingTime = previousAmbientReading.Reading.ReadingTime;
            var previousLiquidReading = GetPreviousLiquidReading(measurement.Id, readingTime);
            if (previousLiquidReading == null)
            {
                return -1000;
            }

            double? currentLiquidReading = readings.GetSensorReading(previousLiquidReading.SensorId);
            if(currentLiquidReading == null)
            {
                return -1000;
            }

            var delta = (readings.ReadingTime - previousLiquidReading.Reading.ReadingTime).TotalMinutes;

            var coolingRate = GetCoolingRate((double)previousLiquidReading.Reading.Value,
                                             (double)previousAmbientReading.Reading.Value,
                                             currentLiquidReading.Value,
                                             delta);

            if(coolingRate == 0)
            {
                return -1000;
            }

            measurement.CoolingRate = (float)coolingRate;

            return -1000;
        }

        private ReadingWithSensorHack GetPreviousAmbientReading(int measurementId, DateTime backFromReadingTime)
        {
            return _dataContext.SensorReadings
                                .Where(r => r.SensorRole.RoleName == _ambientSensorId &&
                                            r.Measurement.Id == measurementId &&
                                            r.ReadingTime < backFromReadingTime)
                                .OrderByDescending(r => r.ReadingTime)
                                .Take(1)
                                .Select(r => new ReadingWithSensorHack
                                    {
                                        SensorId = r.SensorRole.Sensor.Id,
                                        Reading = r
                                    })
                                .FirstOrDefault();
        }

        private ReadingWithSensorHack GetPreviousLiquidReading(int measurementId, DateTime readingTime)
        {
            return _dataContext.SensorReadings
                                .Where(r => r.SensorRole.RoleName == _liquidSensorId &&
                                            r.Measurement.Id == measurementId &&
                                            r.ReadingTime == readingTime)
                                    .OrderByDescending(r => r.ReadingTime)
                                    .Take(1)
                                    .Select(r => new ReadingWithSensorHack {
                                        SensorId = r.SensorRole.Sensor.Id,
                                        Reading = r })
                                    .FirstOrDefault();
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

        public string DisplayValue(double value)
        {
            return value.ToString();
        }

        private class ReadingWithSensorHack
        {
            public string SensorId;
            public Reading Reading;
        }
    }
}
