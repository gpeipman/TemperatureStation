using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemperatureStation.Web.Data
{
    public abstract class Reading
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public DateTime ReadingTime { get; set; }

        public string ReadingType { get; set; }

        public decimal Value { get; set; }
        
        [Required]
        public Measurement Measurement { get; set; } 
    }
}
