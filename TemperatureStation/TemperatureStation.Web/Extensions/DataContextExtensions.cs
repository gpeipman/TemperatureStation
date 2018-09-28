using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Extensions
{
    public static class DataContextExtensions
    {
        public static IOrderedQueryable<T> OrderByIf<T, TKey>(this IQueryable<T> query, Expression<Func<T, TKey>> expression, Func<bool?> orderAction) where T : class
        {
            var actionValue = orderAction();

            if(actionValue == null)
            {
                return query.OrderBy(r => (T)null);
            }

            if(actionValue.Value)
            {
                return query.OrderBy(expression);
            }

            return query.OrderByDescending(expression);
        }

        public static IDictionary<string, Tuple<double, double>> GetMeasurementStats(this ApplicationDbContext context, int measurementId)
        {
            var stats1 = context.SensorReadings
                                .Where(r => r.Measurement.Id == measurementId)
                                .GroupBy(r => r.SensorRole.RoleName)
                                .Select(r => new MeasurementStats
                                {
                                    Name = r.Key,
                                    MeasurementId = measurementId,
                                    Min = r.Min(s => s.Value),
                                    Max = r.Max(s => s.Value)
                                })
                                .ToList();

            var stats2 = context.CalculatorReadings
                                .Where(r => r.Measurement.Id == measurementId)
                                .GroupBy(r => r.Calculator.Name)
                                .Select(r => new MeasurementStats
                                {
                                    Name = r.Key,
                                    MeasurementId = measurementId,
                                    Min = r.Min(s => s.Value),
                                    Max = r.Max(s => s.Value)
                                })
                                .ToList();

            stats1.AddRange(stats2);

            return stats1.ToDictionary(k => k.Name, v => new Tuple<double, double>(v.Min, v.Max));
        }
    }
}
