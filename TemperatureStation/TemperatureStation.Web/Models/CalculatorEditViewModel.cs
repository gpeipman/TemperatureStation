using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace TemperatureStation.Web.Models
{
    public class CalculatorEditViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Parameters { get; set; }
        public int MeasurementId { get; set; }
        
        public IList<SelectListItem> Calculators { get; set; }

        public CalculatorEditViewModel()
        {
            Calculators = new List<SelectListItem>();
        }
    }
}
