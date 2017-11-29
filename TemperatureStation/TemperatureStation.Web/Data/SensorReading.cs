using System.ComponentModel.DataAnnotations;

namespace TemperatureStation.Web.Data
{
    public class SensorReading : Reading
    {
        [Required]
        public SensorRole SensorRole { get; set; }

        public override string Name
        {
            get { return SensorRole?.RoleName; }
        }
    }
}
