using System;
using System.Collections.Generic;
using System.Linq;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Models;

namespace TemperatureStation.Web.Extensions
{
    public static class DataContextExtensions
    {
        public static IEnumerable<IGrouping<DateTime,ReadingViewModel>> GetReadings(this ApplicationDbContext context, int? measurementId, DateTime? newerThan, int? rowCount)
        {
            DateTime[] dates = null;
            IQueryable<DateTime> datesQuery;

            datesQuery = context.Readings
                                .Where(r =>
                                        (measurementId == null || r.Measurement.Id == measurementId)
                                        && (newerThan == null || r.ReadingTime > newerThan))
                                .OrderByDescending(r => r.ReadingTime)
                                .Select(r => r.ReadingTime)
                                .Distinct();

            if (rowCount.HasValue && rowCount.Value > 0)
            {
                datesQuery = datesQuery.Take(rowCount.Value);
            }
            else
            {
                datesQuery = datesQuery.Take(10);
            }

            dates = datesQuery.ToArray();
            
            var readings1 = context.SensorReadings
                                        .Where(r =>
                                                (measurementId == null || r.Measurement.Id == measurementId)
                                               && (dates == null || dates.Contains(r.ReadingTime)))
                                        .OrderByDescending(r => r.ReadingTime)
                                        .Select(r => new ReadingViewModel
                                        {
                                            Id = r.Id,
                                            ReadingTime = r.ReadingTime,
                                            Source = r.SensorRole.RoleName,
                                            Value = r.Value
                                        })
                                        .ToList();

            var readings2 = context.CalculatorReadings
                                        .Where(r =>
                                                (measurementId == null || r.Measurement.Id == measurementId)
                                               && (dates == null || dates.Contains(r.ReadingTime)))
                                        .OrderByDescending(r => r.ReadingTime)
                                        .Select(r => new ReadingViewModel
                                        {
                                            Id = r.Id,
                                            ReadingTime = r.ReadingTime,
                                            Source = r.Calculator.Name,
                                            Value = r.Value
                                        })
                                        .ToList();

            readings1.AddRange(readings2);
            readings1 = readings1.OrderByDescending(r => r.ReadingTime)
                                 .OrderBy(r => r.Source)
                                 .ToList();

            var grouped = readings1.OrderBy(r => r.ReadingTime)
                                   .GroupBy(r => r.ReadingTime);

            return grouped;
        }

        public static IDictionary<string, Tuple<double, double>> GetMeasurementStats(this ApplicationDbContext context, int measurementId)
        {
            var stats1 = context.SensorReadings
                                .Where(r => r.Measurement.Id == measurementId)
                                .GroupBy(r => r.SensorRole.RoleName)
                                .Select(r => new
                                {
                                    Name = r.Key,
                                    Min = r.Min(s => s.Value),
                                    Max = r.Max(s => s.Value)
                                })
                                .ToList();

            var stats2 = context.CalculatorReadings
                                .Where(r => r.Measurement.Id == measurementId)
                                .GroupBy(r => r.Calculator.Name)
                                .Select(r => new
                                {
                                    Name = r.Key,
                                    Min = r.Min(s => s.Value),
                                    Max = r.Max(s => s.Value)
                                })
                                .ToList();

            stats1.AddRange(stats2);
            
            return stats1.ToDictionary(k => k.Name, v => new Tuple<double, double>(v.Min, v.Max));
        }
    }
}
