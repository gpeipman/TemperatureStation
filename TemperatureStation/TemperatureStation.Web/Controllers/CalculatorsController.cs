using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Calculators;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;
using TemperatureStation.Web.Models;

namespace TemperatureStation.Web.Controllers
{
    [Authorize(Roles = "Administrator,PowerUser")]
    public class CalculatorsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly PageContext _pageContext;
        private readonly ICalculatorProvider _calculatorProvider;

        public CalculatorsController(ApplicationDbContext context, 
                                     PageContext pageContext,
                                     ICalculatorProvider calculatorProvider)
        {
            _context = context;
            _pageContext = pageContext;
            _calculatorProvider = calculatorProvider;
        }

        public IActionResult Create(int measurementId)
        {
            _pageContext.Title = "Create calculator";

            var model = new CalculatorEditViewModel();
            model.MeasurementId = measurementId;
            model.Calculators = GetCalculatorsDropDown();

            return View("Edit", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CalculatorEditViewModel calculator)
        {
            return await Edit(calculator);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                _pageContext.Title = "Calculator not found";
                return NotFound();
            }

            var calculator = await _context.Calculators
                                           .Include(m => m.Measurement)
                                           .ProjectTo<CalculatorEditViewModel>()
                                           .SingleOrDefaultAsync(m => m.Id == id);
            if (calculator == null)
            {
                _pageContext.Title = "Calculator not found";
                return NotFound();
            }

            calculator.Calculators = GetCalculatorsDropDown(calculator.Id.ToString());

            return View(calculator);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(CalculatorEditViewModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Calculator calculator;
                    if (model.Id == 0)
                    {
                        calculator = new Calculator();
                        calculator.Measurement = _context.Measurements.FirstOrDefault(m => m.Id == model.MeasurementId);

                        _pageContext.Title = "Create calculator";
                    }
                    else
                    {
                        calculator = _context.Calculators
                                             .Include(m => m.Measurement)
                                             .FirstOrDefault(s => s.Id == model.Id);

                        _pageContext.Title = "Edit calculator " + calculator.Name;
                    }

                    Mapper.Map(model, calculator);

                    if (model.Id == 0)
                    {
                        _context.Calculators.Add(calculator);
                    }

                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (model.Id > 0 && !CalculatorExists(model.Id))
                    {
                        _pageContext.Title = "Calculator not found";
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToAction("Edit", "Measurements", new { id = model.MeasurementId });
            }

            model.Calculators = GetCalculatorsDropDown(model.Id.ToString());

            return View(model);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                _pageContext.Title = "Calculator not found";
                return NotFound();
            }

            var calculator = await _context.Calculators
                                           .Include(c => c.Measurement)
                                           .SingleOrDefaultAsync(m => m.Id == id);
            if (calculator == null)
            {
                _pageContext.Title = "Calculator not found";
                return NotFound();
            }

            _pageContext.Title = "Delete calculator " + calculator.Name;

            return View(calculator);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var calculator = await _context.Calculators
                                           .Include(c => c.Measurement)
                                           .SingleOrDefaultAsync(m => m.Id == id);

            var measurementId = calculator.Measurement.Id;

            _context.Database.ExecuteSqlCommand("DELETE FROM Readings WHERE CalculatorId={0}", calculator.Id);
            _context.Calculators.Remove(calculator);
            await _context.SaveChangesAsync();

            return RedirectToAction("Edit", "Measurements", new { id = measurementId });
        }

        private bool CalculatorExists(int id)
        {
            return _context.Calculators.Any(e => e.Id == id);

        }
        private IList<SelectListItem> GetCalculatorsDropDown(string selectedId = null)
        {
            return _calculatorProvider.GetNames()
                                      .OrderBy(s => s)
                                      .Select(s => new SelectListItem
                                      {
                                          Value = s,
                                          Text = s,
                                          Selected = (s == selectedId)
                                      })
                                      .ToList();
        }
    }
}
