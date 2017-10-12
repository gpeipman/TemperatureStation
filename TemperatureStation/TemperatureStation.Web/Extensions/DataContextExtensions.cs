using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Extensions
{
    public static class DataContextExtensions
    {
        public static IQueryable<T> OrderByIf<T, TKey>(this IQueryable<T> query, Expression<Func<T, TKey>> expression, Func<bool?> orderAction)
        {
            var actionValue = orderAction();

            if(actionValue == null)
            {
                return query;
            }

            if(actionValue.Value)
            {
                return query.OrderBy(expression);
            }

            return query.OrderByDescending(expression);
        }

        public static IDictionary<string, Tuple<double, double>> GetMeasurementStats(this ApplicationDbContext context, int measurementId)
        {
            // NB!
            // Until EF Core starts supporting GROUP BY the code here uses special view in database for
            // sensor and calculator stats



            //var stats1 = context.SensorReadings
            //                    .Where(r => r.Measurement.Id == measurementId)
            //                    .GroupBy(r => r.SensorRole.RoleName)
            //                    .Select(r => new SensorStats
            //                    {
            //                        Name = r.Key,
            //                        MeasurementId = measurementId,
            //                        Min = r.Min(s => s.Value),
            //                        Max = r.Max(s => s.Value)
            //                    })
            //                    .ToList();

            //var stats2 = context.CalculatorReadings
            //                    .Where(r => r.Measurement.Id == measurementId)
            //                    .GroupBy(r => r.Calculator.Name)
            //                    .Select(r => new SensorStats
            //                    {
            //                        Name = r.Key,
            //                        MeasurementId = measurementId,
            //                        Min = r.Min(s => s.Value),
            //                        Max = r.Max(s => s.Value)
            //                    })
            //                    .ToList();

            //stats1.AddRange(stats2);

            var stats1 = context.MeasurementStats.Where(s => s.MeasurementId == measurementId).ToList();

            return stats1.ToDictionary(k => k.Name, v => new Tuple<double, double>(v.Min, v.Max));
        }
    }
}
