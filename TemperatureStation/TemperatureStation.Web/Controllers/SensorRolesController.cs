using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;
using TemperatureStation.Web.Models.MeasurementViewModels;

namespace TemperatureStation.Web.Controllers
{
    [Authorize(Roles = "Administrator,PowerUser")]
    public class SensorRolesController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly PageContext _pageContext;

        public SensorRolesController(ApplicationDbContext context, PageContext pageContext)
        {
            _context = context;
            _pageContext = pageContext;

            _pageContext.ActiveMenu = "Measurements";
        }

        public IActionResult Create(int measurementId)
        {
            _pageContext.Title = "Add sensor role";

            var model = new SensorRoleEditViewModel();
            model.MeasurementId = measurementId;
            model.Sensors = GetSensorsDropDown();

            return View("Edit", model);
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SensorRoleEditViewModel sensorRole)
        {
            return await Edit(sensorRole);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            _pageContext.Title = "Edit sensor role";

            if (id == null)
            {
                return NotFound();
            }

            var sensorRole = await _context.SensorRoles
                                           .ProjectTo<SensorRoleEditViewModel>()
                                           .SingleOrDefaultAsync(m => m.Id == id);
            if (sensorRole == null)
            {
                return NotFound();
            }

            sensorRole.Sensors = GetSensorsDropDown(sensorRole.SensorId);

            return View(sensorRole);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(SensorRoleEditViewModel model)
        {
            _pageContext.Title = "Edit sensor role";

            if (ModelState.IsValid)
            {
                try
                {
                    SensorRole sensorRole;
                    if(model.Id == 0)
                    {
                        sensorRole = new SensorRole();
                        sensorRole.Measurement = _context.Measurements.FirstOrDefault(m => m.Id == model.MeasurementId);
                    }
                    else
                    {
                        sensorRole = _context.SensorRoles.FirstOrDefault(s => s.Id == model.Id);
                    }

                    sensorRole.Sensor = _context.Sensors.FirstOrDefault(s => s.Id == model.SensorId);

                    Mapper.Map(model, sensorRole);

                    if (model.Id == 0)
                    {
                        _context.SensorRoles.Add(sensorRole);
                    }
                    else
                    {
                        _context.Update(sensorRole);
                    }
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (model.Id > 0 && !SensorRoleExists(model.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Edit", "Measurements", new { id = model.MeasurementId });
            }

            model.Sensors = GetSensorsDropDown(model.SensorId);

            return View(model);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            _pageContext.Title = "Delete sensor role";

            if (id == null)
            {
                _pageContext.Title = "Sensor role not found";
                return NotFound();
            }

            var sensorRole = await _context.SensorRoles
                                           .Include(sr => sr.Measurement)
                                           .SingleOrDefaultAsync(m => m.Id == id);
            if (sensorRole == null)
            {
                _pageContext.Title = "Sensor role not found";
                return NotFound();
            }

            return View(sensorRole);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var sensorRole = await _context.SensorRoles
                                           .Include(sr => sr.Measurement)
                                           .SingleOrDefaultAsync(m => m.Id == id);

            var measurementId = sensorRole.Measurement.Id;
            _context.SensorRoles.Remove(sensorRole);
            await _context.SaveChangesAsync();
            return RedirectToAction("Edit", "Measurements", new { id = measurementId });
        }

        private bool SensorRoleExists(int id)
        {
            return _context.SensorRoles.Any(e => e.Id == id);
        }

        private IList<SelectListItem> GetSensorsDropDown(string selectedId = null)
        {
            return _context.Sensors
                        .OrderBy(s => s.Name)
                        .Select(s => new SelectListItem
                        {
                            Value = s.Id,
                            Text = s.Name,
                            Selected = (s.Id == selectedId)
                        })
                        .ToList();
        }
    }
}
