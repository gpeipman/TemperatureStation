using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using Microsoft.Extensions.DependencyModel;

namespace TemperatureStation.Web.Extensions
{
    public static class CalculatorsLoader
    {
        private static IList<Type> _calculatorTypes;

        public static IList<Type> CalculatorTypes
        {
            get
            {
                if(_calculatorTypes == null)
                {
                    LoadCalculatorTypes();
                }

                return _calculatorTypes.ToList();
            }            
        }

        private static void LoadCalculatorTypes()
        {
            if (_calculatorTypes != null)
            {
                return;
            }

            var calcs = from a in GetReferencingAssemblies()
                        from t in a.GetTypes()
                        where t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>() != null
                        select t;

            _calculatorTypes = calcs.OrderBy(t => t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>().Order).ToList();
        }

        private static IEnumerable<Assembly> GetReferencingAssemblies()
        {
            var assemblies = new List<Assembly>();
            var dependencies = DependencyContext.Default.RuntimeLibraries;
            foreach (var library in dependencies)
            {
                try
                {
                    var assembly = Assembly.Load(new AssemblyName(library.Name));
                    assemblies.Add(assembly);
                }
                catch (FileNotFoundException)
                { }
                catch (Exception)
                {
                    throw;
                }
            }
            return assemblies;
        }
    }
}
