using System;

namespace TemperatureStation.Web.Extensions
{
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = true)]
    public class CalculatorAttribute : Attribute
    {
        public CalculatorAttribute()
        {
            Order = -1;
        }

        public string Name { get; set; }
        public int Order { get; set; }
    }
}
