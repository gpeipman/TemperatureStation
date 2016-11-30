using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;
using TemperatureStation.Web.Models;

namespace TemperatureStation.Web.Controllers
{
    public class CalculatorsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CalculatorsController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Create(int measurementId)
        {
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
                return NotFound();
            }

            var calculator = await _context.Calculators
                                           .ProjectTo<CalculatorEditViewModel>()
                                           .SingleOrDefaultAsync(m => m.Id == id);
            if (calculator == null)
            {
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
                    }
                    else
                    {
                        calculator = _context.Calculators.FirstOrDefault(s => s.Id == model.Id);
                    }

                    Mapper.Map(model, calculator);

                    if (model.Id == 0)
                    {
                        _context.Calculators.Add(calculator);
                    }
                    else
                    {
                        _context.Update(calculator);
                    }
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (model.Id > 0 && !CalculatorExists(model.Id))
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

            model.Calculators = GetCalculatorsDropDown(model.Id.ToString());

            return View(model);
        }

        private bool CalculatorExists(int id)
        {
            return _context.Calculators.Any(e => e.Id == id);

        }
        private IList<SelectListItem> GetCalculatorsDropDown(string selectedId = null)
        {
            return _context.Calculators
                        .OrderBy(s => s.Name)
                        .Select(s => new SelectListItem
                        {
                            Value = s.Id.ToString(),
                            Text = s.Name,
                            Selected = (s.Id.ToString() == selectedId)
                        })
                        .ToList();
        }
    }
}
