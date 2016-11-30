using System.ComponentModel.DataAnnotations;

namespace TemperatureStation.Web.Data
{
    public class CalculatorReading : Reading
    {
        [Required]
        public Calculator Calculator { get; set; }
    }
}
