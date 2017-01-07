using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using TemperatureStation.Web.Calculators;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;
using SharedModels = TemperatureStation.Shared.Models;

namespace TemperatureStation.Web.Controllers
{
    public class ApiController : Controller
    {
        private ApplicationDbContext _dataContext;
        private IConfiguration _configuration;
        private ICalculatorProvider _calculatorProvider;
        private ILogger<ApiController> _log;

        public ApiController(ApplicationDbContext dataContext, 
                             IConfiguration configuration, 
                             ICalculatorProvider calculatorProvider,
                             ILogger<ApiController> log)
        {
            _dataContext = dataContext;
            _configuration = configuration;
            _calculatorProvider = calculatorProvider;
            _log = log;
        }

        public async Task<IActionResult> Report([FromBody]SharedModels.SensorReadings readings)
        {
            try
            {
                if (!IsDeviceKeyValid())
                {
                    return BadRequest();
                }

                var measurement = await _dataContext.Measurements
                                              .Include(m => m.SensorRoles)
                                              .ThenInclude(r => r.Sensor)
                                              .Include(m => m.Calculators)
                                              .FirstOrDefaultAsync(m => m.IsActive);
                if (measurement == null)
                {
                    return NotFound();
                }

                if (measurement.SensorRoles.Count == 0)
                {
                    return NoContent();
                }

                foreach (var sensorRole in measurement.SensorRoles)
                {
                    var readingForSensor = readings.Readings.FirstOrDefault(r => r.SensorId == sensorRole.Sensor.Id);
                    if (readingForSensor == null)
                    {
                        continue;
                    }

                    var reading = new SensorReading();
                    reading.ReadingTime = readings.ReadingTime;
                    reading.SensorRole = sensorRole;
                    reading.Value = readingForSensor.Reading;
                    reading.Measurement = measurement;

                    _dataContext.Readings.Add(reading);
                }

                var calcs = _calculatorProvider.GetCalculators();

                foreach (var registeredCalculator in measurement.Calculators)
                {
                    if (!calcs.ContainsKey(registeredCalculator.Name))
                    {
                        continue;
                    }

                    var calc = calcs[registeredCalculator.Name];
                    calc.SetParameters(registeredCalculator.Parameters);

                    if (calc.ReturnsReading)
                    {
                        var reading = new CalculatorReading();
                        reading.Calculator = registeredCalculator;
                        reading.Measurement = measurement;
                        reading.ReadingTime = readings.ReadingTime;
                        reading.Value = calc.Calculate(readings, measurement);

                        _dataContext.Readings.Add(reading);
                    }
                    else
                    {
                        calc.Calculate(readings, measurement);
                    }
                }

                await _dataContext.SaveChangesAsync();

                return NoContent();
            }
            catch(Exception ex)
            {
                _log.LogError(ex.ToString());
                throw ex;
            }
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

        public IActionResult GetNewReadings([FromQuery]DateTime newerThan, [FromQuery]int measurementId,  [FromQuery]int rowCount)
        {
            if (!IsDeviceKeyValid())
            {
                return BadRequest();
            }

            var results = _dataContext.GetReadings(measurementId, newerThan, rowCount);

            return Json(results);
        }

        [NonAction]
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