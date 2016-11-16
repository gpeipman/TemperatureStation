using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TemperatureStation.Web.Data;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Models;
using AutoMapper.QueryableExtensions;

namespace TemperatureStation.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _dataContext;

        public HomeController(ApplicationDbContext dataContext)
        {
            _dataContext = dataContext;
        }

        public async Task<IActionResult> Index()
        {
            var model = new HomeViewModel();
            model.Measurement = await _dataContext.Measurements
                                                  .Include(m => m.SensorRoles)
                                                  .SingleOrDefaultAsync(m => m.IsActive);
            if (model.Measurement != null)
            {
                var readings = await _dataContext.Readings
                                          .Include(r => r.SensorRole)
                                          .ThenInclude(sr => sr.Measurement)
                                          .Where(r => r.SensorRole.Measurement.Id == model.Measurement.Id)
                                          .OrderByDescending(r => r.ReadingTime)
                                          .ProjectTo<ReadingViewModel>()
                                          .Take(48)
                                          .ToListAsync();

                model.Readings = readings.OrderBy(r => r.ReadingTime)
                                         .GroupBy(r => r.ReadingTime);
            }

            return View(model); 
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}