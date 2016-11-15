using System.ComponentModel.DataAnnotations;

namespace TemperatureStation.Web.Data
{
    public class Sensor
    {
        [Key]
        public string Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}