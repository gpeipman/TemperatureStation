using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace TemperatureStation.Web.Models.MeasurementViewModels
{
    public class SensorRoleEditViewModel
    {
        public int Id { get; set; }
        public string RoleName { get; set; }
        public int MeasurementId { get; set; }
        public string SensorId { get; set; }

        public IEnumerable<SelectListItem> Sensors { get; set; }

        public SensorRoleEditViewModel()
        {
            Sensors = new List<SelectListItem>();
        }
    }
}
