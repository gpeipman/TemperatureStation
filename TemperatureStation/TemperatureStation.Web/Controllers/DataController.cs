using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Calculators;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;
using TemperatureStation.Web.Models.DataViewModels;

namespace TemperatureStation.Web.Controllers
{
    public class DataController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ICalculatorProvider _calcProvider;

        public DataController(ApplicationDbContext context, ICalculatorProvider calcProvider)
        {
            _context = context;
            _calcProvider = calcProvider;
        }

        public IActionResult Index(int id, int page = 1)
        {
            var model = new DataViewModel();
            model.Measurement = _context.Measurements
                                        .Include(m => m.SensorRoles)
                                        .Include(m => m.Calculators)
                                        .FirstOrDefault(m => m.Id == id);

            var dates = _context.Readings
                                .Where(r => r.Measurement.Id == id)
                                .OrderByDescending(r => r.ReadingTime)
                                .Select(r => r.ReadingTime)
                                .Distinct()
                                .GetPaged(page, 10);

            var readings = new List<Reading>();

            var sensorReadings = _context.SensorReadings
                                   .Include(sr => sr.SensorRole)
                                   .Where(r => r.Measurement.Id == id && dates.Results.Contains(r.ReadingTime))
                                   .OrderByDescending(r => r.ReadingTime);

            var calculatorReadings = _context.CalculatorReadings
                                   .Include(sr => sr.Calculator)
                                   .Where(r => r.Measurement.Id == id && dates.Results.Contains(r.ReadingTime))
                                   .OrderByDescending(r => r.ReadingTime);

            readings.AddRange(sensorReadings.ToList());
            readings.AddRange(calculatorReadings.ToList());

            var grouped = readings.OrderByDescending(r => r.ReadingTime)
                                  .GroupBy(r => r.ReadingTime)
                                  .ToList();

            var result = new PagedResult<IGrouping<DateTime,Reading>>();
            result.CurrentPage = dates.CurrentPage;
            result.PageCount = dates.PageCount;
            result.PageSize = dates.PageSize;
            result.RowCount = dates.RowCount;
            result.Results = grouped;

            model.Data = result;
            model.Labels = _calcProvider.GetTypes()
                                        .Where(t => t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>() != null)
                                        .Select(t => new
                                        {
                                            Label = t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>().DisplayLabel,
                                            Name = t.GetTypeInfo().GetCustomAttribute<CalculatorAttribute>().Name
                                        })
                                        .ToDictionary(k => k.Name, e => e.Label ?? e.Name);
            return View(model);
        }

        public IActionResult Edit(int id, DateTime readingDate)
        {
            var model = new DataEditModel();
            model.Measurement = _context.Measurements
                                        .Include(m => m.SensorRoles)
                                        .Include(m => m.Calculators)
                                        .FirstOrDefault();

            if(model.Measurement == null)
            {
                return NotFound();
            }

            return View(model);
        }
    }
}