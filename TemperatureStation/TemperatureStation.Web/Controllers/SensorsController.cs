using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;

namespace TemperatureStation.Web.Controllers
{
    [Authorize(Roles = "Administrator,PowerUser")]
    public class SensorsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly PageContext _pageContext;

        public SensorsController(ApplicationDbContext context, PageContext pageContext)
        {
            _context = context;
            _pageContext = pageContext;

            _pageContext.ActiveMenu = "Sensors";
        }

        public IActionResult Index(int page = 1)
        {
            page = Math.Max(1, page);
            _pageContext.Title = "Sensors";

            var sensors = _context.Sensors.GetPaged(page, 10);

            return View(sensors);
        }

        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                _pageContext.Title = "Sensor not found";
                return NotFound();
            }

            var sensor = await _context.Sensors.SingleOrDefaultAsync(m => m.Id == id);
            if (sensor == null)
            {
                _pageContext.Title = "Sensor not found";
                return NotFound();
            }

            _pageContext.Title = "Sensor " + sensor.Name;
            return View(sensor);
        }

        public IActionResult Create()
        {
            _pageContext.Title = "Create sensor";

            return View("Edit", new Sensor());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name")] Sensor sensor)
        {
            if (ModelState.IsValid)
            {
                _context.Add(sensor);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return await Edit("", sensor);
        }

        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                _pageContext.Title = "Sensor not found";
                return NotFound();
            }

            var sensor = await _context.Sensors.SingleOrDefaultAsync(m => m.Id == id);
            if (sensor == null)
            {
                _pageContext.Title = "Sensor not found";
                return NotFound();
            }

            _pageContext.Title = "Edit " + sensor.Name;
            return View(sensor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Name")] Sensor sensor)
        {
            if (id != sensor.Id)
            {
                _pageContext.Title = "Sensor not found";
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(sensor);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SensorExists(sensor.Id))
                    {
                        _pageContext.Title = "Sensor not found";
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToAction("Index");
            }

            if (string.IsNullOrEmpty(sensor.Id))
            {
                _pageContext.Title = "Create sensor";
            }
            else
            {
                _pageContext.Title = "Edit sensor " + sensor.Name;
            }

            return View(sensor);
        }

        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                _pageContext.Title = "Sensor not found";
                return NotFound();
            }

            var sensor = await _context.Sensors.SingleOrDefaultAsync(m => m.Id == id);
            if (sensor == null)
            {
                _pageContext.Title = "Sensor not found";
                return NotFound();
            }

            _pageContext.Title = "Delete sensor " + sensor.Name;
            return View(sensor);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var sensor = await _context.Sensors.SingleOrDefaultAsync(m => m.Id == id);
            _context.Sensors.Remove(sensor);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool SensorExists(string id)
        {
            return _context.Sensors.Any(e => e.Id == id);
        }
    }
}