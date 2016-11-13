using Microsoft.AspNetCore.Mvc;
using TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Controllers
{
    public class ApiController : Controller
    {
        private ApplicationDbContext _dataContext;

        public ApiController(ApplicationDbContext dataContext)
        {
            _dataContext = dataContext;
        }

        public IActionResult Report(SensorReadings readings)
        {              
            return View();
        }
    }
}