using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace TemperatureStation.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = new WebHostBuilder()
                .UseKestrel()
                .UseContentRoot(Directory.GetCurrentDirectory())
                .UseIISIntegration() // IMPORTANT!!!
                .UseStartup<Startup>()
                .Build();

            host.Run();
        }
    }
}
