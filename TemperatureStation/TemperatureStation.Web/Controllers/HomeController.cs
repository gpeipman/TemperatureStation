using Microsoft.AspNetCore.Mvc;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _dataContext;

        public HomeController(ApplicationDbContext dataContext)
        {
            _dataContext = dataContext;
        }

        public IActionResult Index()
        {
            return View(); 
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}