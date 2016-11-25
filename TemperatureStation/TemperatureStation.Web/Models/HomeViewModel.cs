using System;
using System.Collections.Generic;
using System.Linq;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Models
{
    public class HomeViewModel
    {
        public Measurement Measurement { get; set; }
        public IEnumerable<IGrouping<DateTime, ReadingViewModel>> Readings { get; set; }

        public HomeViewModel()
        {
            Readings = new List<IGrouping<DateTime, ReadingViewModel>>();
        }
    }
}
