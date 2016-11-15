using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Controllers
{
    public class ApiController : Controller
    {
        private ApplicationDbContext _dataContext;
        private IConfiguration _configuration;

        public ApiController(ApplicationDbContext dataContext, IConfiguration configuration)
        {
            _dataContext = dataContext;
            _configuration = configuration;
        }

        public IActionResult Report([FromBody]SensorReadings readings)
        {
            if(!IsDeviceKeyValid())
            {
                return BadRequest();
            }

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

        public IActionResult UpdateSensors([FromBody]string[] sensorIds)
        {
            if (!IsDeviceKeyValid())
            {
                return BadRequest();
            }

            foreach (var sensorId in sensorIds)
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

            return NoContent();
        }

        private bool IsDeviceKeyValid()
        {
            if (!Request.Headers.ContainsKey("DeviceKey"))
            {
                return false;
            }

            var deviceKey = Request.Headers["DeviceKey"].First();

            return (deviceKey == _configuration.GetValue<string>("DeviceKey"));
        }
    }
}