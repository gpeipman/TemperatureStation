using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;
using TemperatureStation.Web.Models.MeasurementViewModels;

namespace TemperatureStation.Web.Controllers
{
    [Authorize(Roles = "Administrator, PowerUser")]
    public class MeasurementsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly PageContext _pageContext;

        public MeasurementsController(ApplicationDbContext context, PageContext pageContext)
        {
            _context = context;
            _pageContext = pageContext;

            _pageContext.ActiveMenu = "Measurements";
        }

        public IActionResult Index(int page = 1)
        {
            var measurements = _context.Measurements.GetPaged(page, 10);

            return View(measurements);
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var measurement = await _context.Measurements
                                            .Include(m => m.Calculators)
                                            .Include(m => m.SensorRoles)
                                            .ThenInclude(s => s.Sensor)
                                            .SingleOrDefaultAsync(m => m.Id == id);
            
            if (measurement == null)
            {
                return NotFound();
            }

            return View(measurement);
        }

        public IActionResult Create()
        {
            return View("Edit", new MeasurementEditViewModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(MeasurementEditViewModel measurement)
        {
            return await Edit(measurement);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var measurement = await _context.Measurements
                                            .Include(m => m.Calculators)
                                            .Include(m => m.SensorRoles)
                                            .ThenInclude(s => s.Sensor)
                                            .ProjectTo<MeasurementEditViewModel>()
                                            .SingleOrDefaultAsync(m => m.Id == id);
            if (measurement == null)
            {
                return NotFound();
            }

            return View("Edit", measurement);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(MeasurementEditViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View("Edit", model);
            }

            try
            {
                Measurement measurement;

                if (model.Id == 0)
                {
                    measurement = new Measurement();
                    _context.Measurements.Add(measurement);
                }
                else
                {
                    measurement = _context.Find<Measurement>(model.Id);                    
                }

                Mapper.Map(model, measurement);

                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (model.Id > 0 && !MeasurementExists(model.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return RedirectToAction("Index");          
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var measurement = await _context.Measurements.SingleOrDefaultAsync(m => m.Id == id);
            if (measurement == null)
            {
                return NotFound();
            }

            return View(measurement);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var measurement = await _context.Measurements.SingleOrDefaultAsync(m => m.Id == id);
            _context.Measurements.Remove(measurement);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Clear(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var measurement = await _context.Measurements.SingleOrDefaultAsync(m => m.Id == id);
            if (measurement == null)
            {
                return NotFound();
            }

            return View(measurement);
        }

        [HttpPost, ActionName("Clear")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ClearConfirmed(int id)
        {
            var measurement = await _context.Measurements.SingleOrDefaultAsync(m => m.Id == id);
            _context.Database.ExecuteSqlCommand("DELETE FROM Readings WHERE MeasurementId={0}", measurement.Id);
            await _context.SaveChangesAsync();

            return RedirectToAction("Index");
        }

        private bool MeasurementExists(int id)
        {
            return _context.Measurements.Any(e => e.Id == id);
        }
    }
}
