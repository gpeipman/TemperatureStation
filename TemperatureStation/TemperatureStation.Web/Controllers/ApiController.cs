using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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

        public async Task<IActionResult> Report([FromBody]SensorReadings readings)
        {
            if(!IsDeviceKeyValid())
            {
                return BadRequest();
            }

            var measurement = await _dataContext.Measurements
                                          .Include(m => m.SensorRoles)
                                          .ThenInclude(r => r.Sensor)
                                          .FirstOrDefaultAsync(m => m.IsActive);
            if (measurement == null)
            {
                return NotFound();
            }

            if(measurement.SensorRoles.Count == 0)
            {
                return NoContent();
            }

            foreach(var sensorRole in measurement.SensorRoles)
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

            await _dataContext.SaveChangesAsync();

            return NoContent();
        }

        public async Task<IActionResult> UpdateSensors([FromBody]string[] sensorIds)
        {
            if (!IsDeviceKeyValid())
            {
                return BadRequest();
            }

            foreach (var sensorId in sensorIds)
            {
                var sensor = await _dataContext.Sensors.SingleOrDefaultAsync(s => s.Id == sensorId);
                if(sensor != null)
                {
                    continue;
                }

                sensor = new Sensor();
                sensor.Id = sensorId;
                sensor.Name = sensorId;

                _dataContext.Sensors.Add(sensor);                
            }

            await _dataContext.SaveChangesAsync();

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