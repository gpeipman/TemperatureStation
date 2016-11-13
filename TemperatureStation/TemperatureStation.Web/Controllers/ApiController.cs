using System;
using System.Linq;
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
            var measurement = _dataContext.Measurements.FirstOrDefault(m => m.IsActive);
            if (measurement == null)
            {
                throw new Exception("Cannot find active measurement");
            }

            var sensorRoles = _dataContext.SensorRoles.Where(r => r.Measurement.Id == measurement.Id);
            if(sensorRoles.Count() == 0)
            {
                return null;
            }

            foreach(var sensorRole in sensorRoles)
            {
                var readingForSensor = readings.Readings.FirstOrDefault(r => r.SensorId == sensorRole.Sensor.Id);
                if(readingForSensor == null)
                {
                    continue;
                }

                var reading = new Reading();
                reading.ReadingTime = readings.ReadingTime;
                reading.SensorRole = sensorRole;
                reading.Value = readingForSensor.Reading;

                _dataContext.Readings.Add(reading);
            }

            _dataContext.SaveChanges();

            return View();
        }
    }
}