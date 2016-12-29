using System.Collections.Generic;

namespace TemperatureStation.Web.Extensions
{
    public interface ICalculatorProvider
    {
        IDictionary<string, ICalculator> GetCalculators();
        IEnumerable<string> GetNames();
    }
}
