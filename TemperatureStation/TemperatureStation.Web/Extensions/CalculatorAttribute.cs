using System;

namespace TemperatureStation.Web.Extensions
{
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = true)]
    public class CalculatorAttribute : Attribute
    {
        public string Name { get; set; }
    }
}
