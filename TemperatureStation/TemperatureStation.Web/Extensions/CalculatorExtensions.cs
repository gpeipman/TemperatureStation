using Microsoft.Extensions.DependencyInjection;

namespace TemperatureStation.Web.Extensions
{
    public static class CalculatorExtensions
    {
        public static void AddCalculators(this IServiceCollection services, ICalculatorProvider provider)
        {
            foreach(var calcType in provider.GetTypes())
            {
                services.AddTransient(calcType);
            }
        }
    }
}
