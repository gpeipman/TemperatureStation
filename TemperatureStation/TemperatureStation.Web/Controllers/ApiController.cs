using Microsoft.AspNetCore.Mvc;
using TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Controllers
{
    public class ApiController : Controller
    {
        public IActionResult Report(SensorReadings readings)
        {  
            return View();
        }
    }
}