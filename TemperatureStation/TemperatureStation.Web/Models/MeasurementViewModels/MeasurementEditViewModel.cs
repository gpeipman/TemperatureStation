using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace TemperatureStation.Web.Models.MeasurementViewModels
{
    public class MeasurementEditViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }

        public IList<SensorRoleViewModel> SensorRoles { get; set; }
        public IList<CalculatorEditViewModel> Calculators { get; set; }

        public MeasurementEditViewModel()
        {
            SensorRoles = new List<SensorRoleViewModel>();
            Calculators = new List<CalculatorEditViewModel>();
        }
    }
}
