using System;
using System.Collections.Generic;

namespace TemperatureStation.Web.Calculators
{
    public interface ICalculatorProvider
    {
        IDictionary<string, ICalculator> GetCalculators();
        IEnumerable<string> GetNames();
        IEnumerable<Type> GetTypes();
    }
}
