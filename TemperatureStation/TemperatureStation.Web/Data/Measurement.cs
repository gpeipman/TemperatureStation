using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemperatureStation.Web.Data
{
    public class Measurement
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public string Name { get; set; }

        public bool IsActive { get; set; }

        public IList<SensorRole> SensorRoles { get; set; }

        public Measurement()
        {
            SensorRoles = new List<SensorRole>();
        }
    }
}
