using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Models;

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
            _dataContext.ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;


            var model = new HomeViewModel();
            model.Measurement = await _dataContext.Measurements
                                                  .Include(m => m.SensorRoles)
                                                  .SingleOrDefaultAsync(m => m.IsActive);
            if(model.Measurement == null)
            {
                return View("IndexEmpty");
            }
            
            // ToDo: Separate query for calculators because EF generates only inner joins currently
            var readings1 = await _dataContext.Readings
                                        .Include(sr => sr.Measurement)
                                        .Include(r => ((SensorReading)r).SensorRole)
                                        .Where(r => r.Measurement.Id == model.Measurement.Id)
                                        .OrderByDescending(r => r.ReadingTime)
                                        .Take(48)
                                        .ToListAsync();
            var readings = new List<ReadingViewModel>();
            Mapper.Map(readings1, readings);

            model.Readings = readings.OrderBy(r => r.ReadingTime)
                                     .GroupBy(r => r.ReadingTime);
            return View(model); 
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}