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

        [Required]
        public string Name { get; set; }

        public bool IsActive { get; set; }
        public double? CoolingRate { get; set; }
        public double? FreezingPoint { get; set; }
        public double? OriginalGravity { get; set; }
        public double? FinalGravity { get; set; }
        public double? AlcoholByVolume { get; set; }
        public double? AlcoholByWeight { get; set; }

        public virtual IList<SensorRole> SensorRoles { get; set; }
        public virtual IList<Calculator> Calculators { get; set; }

        public Measurement()
        {
            Calculators = new List<Calculator>();
            SensorRoles = new List<SensorRole>();
        }
    }
}