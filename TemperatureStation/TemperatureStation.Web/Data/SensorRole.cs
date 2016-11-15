using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemperatureStation.Web.Data
{
    public class SensorRole
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public string RoleName { get; set; }

        [Required]
        public Measurement Measurement { get; set; }

        [Required]
        public Sensor Sensor { get; set; }
    }
}
