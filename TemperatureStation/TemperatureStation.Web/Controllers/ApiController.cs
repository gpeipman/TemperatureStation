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

        public IActionResult Report([FromBody]SensorReadings readings)
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

        public void UpdateSensors([FromBody]string[] sensorIds)
        {
            foreach(var sensorId in sensorIds)
            {
                var sensor = _dataContext.Sensors.SingleOrDefault(s => s.Id == sensorId);
                if(sensor != null)
                {
                    continue;
                }

                sensor = new Sensor();
                sensor.Id = sensorId;
                sensor.Name = sensorId;

                _dataContext.Sensors.Add(sensor);
                _dataContext.SaveChanges();
            }
        }
    }
}