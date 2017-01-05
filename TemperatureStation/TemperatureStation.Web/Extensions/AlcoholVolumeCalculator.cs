using TemperatureStation.Web.Data;
using TemperatureStation.Shared.Models;
using System;

namespace TemperatureStation.Web.Extensions
{
    [Calculator(Name = "Alcohol volume calculator", Order = 0, ShowOnChart = false)]
    public class AlcoholVolumeCalculator : ICalculator
    {
        public bool ReturnsReading
        {
            get { return false; }
        }

        public double Calculate(SensorReadings readings, Measurement measurement)
        {
            if(measurement == null)
            {
                return -1000;
            }

            if(!measurement.OriginalGravity.HasValue && !measurement.OriginalGravity.HasValue)
            {
                return -1000;
            }

            var og = measurement.OriginalGravity.Value;
            var fg = measurement.FinalGravity.Value;

            if (measurement.AlcoholByVolume == null)
            {
                measurement.AlcoholByVolume = Math.Round(GetAlcVol(og, fg), 1);
            }
            if (measurement.AlcoholByWeight == null)
            {
                measurement.AlcoholByWeight = Math.Round(AbvToAbw(GetAlcVol(og, fg)), 1);
            }
            if (measurement.FreezingPoint == null)
            {
                measurement.FreezingPoint = Math.Ceiling(GetFreezingPoint(og, fg));
            }

            return -1000;
        }

        public void SetParameters(string parameters)
        {
        }

        private static double GetFreezingPoint(double og, double fg)
        {
            return (-0.42 * AbvToAbw(GetAlcVol(og, fg))) + (0.04 * SgToPlato(og)) + 0.2;
        }

        private static double SgToPlato(double sg)
        {
            return -676.67 + 1286.4 * sg - 800.47 * sg * sg + 190.74 * sg * sg * sg;
        }

        private static double AbvToAbw(double abv)
        {
            return abv * 0.78924;
        }

        private static double GetAlcVol(double og, double fg)
        {
            return (1.05 / 0.79) * ((og - fg) / fg) * 100;
        }
    }
}
