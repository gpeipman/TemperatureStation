using System;
using System.Linq;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Models.DataViewModels
{
    public class DataEditModel
    {
        public IGrouping<DateTime, ReadingViewModel> Data { get; set; }
        public Measurement Measurement { get; set; }
    }
}
