using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace TemperatureStation.Web.Extensions
{
    public class CalculatorProvider : ICalculatorProvider
    {
        private IServiceProvider _serviceProvider;

        public CalculatorProvider(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public IDictionary<string,ICalculator> GetCalculators()
        {
            var result = new Dictionary<string, ICalculator>();

            foreach(var type in CalculatorsLoader.CalculatorTypes)
            {
                var calc = (ICalculator)_serviceProvider.GetService(type);
                var name = type.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>().Name;

                result.Add(name, calc);
            }

            return result;
        }

        public IEnumerable<string> GetNames()
        {
            return CalculatorsLoader.CalculatorTypes
                    .Select(t => t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>()?.Name)
                    .Where(t => !string.IsNullOrWhiteSpace(t));            
        }

        public IEnumerable<Type> GetTypes()
        {
            return CalculatorsLoader.CalculatorTypes;
        }
    }
}
