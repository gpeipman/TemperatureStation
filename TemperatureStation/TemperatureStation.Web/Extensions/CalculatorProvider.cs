using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using Microsoft.Extensions.DependencyModel;

namespace TemperatureStation.Web.Extensions
{
    public static class CalculatorProvider
    {
        public static IEnumerable<string> ListCalculators()
        {
            var attrs = from a in GetReferencingAssemblies()
                        from t in a.GetTypes()
                        where t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>() != null
                        select t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>();

            return attrs.Select(a => a.Name).OrderBy(a => a);
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
                catch(FileNotFoundException)
                { }
                catch(Exception)
                {
                    throw;
                }
            }
            return assemblies;
        }
    }
}
