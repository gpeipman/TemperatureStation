using Microsoft.Extensions.DependencyInjection;

namespace TemperatureStation.Web.Extensions
{
    public static class CalculatorExtensions
    {
        public static void AddCalculators(this IServiceCollection services)
        {
            foreach(var calcType in CalculatorsLoader.CalculatorTypes)
            {
                services.AddTransient(calcType);
            }
        }
    }
}
