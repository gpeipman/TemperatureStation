using System;
using System.Collections.Generic;
using System.Linq;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;

namespace TemperatureStation.Web.Models.DataViewModels
{
    public class DataViewModel
    {
        public Measurement Measurement { get; set; }
        public IDictionary<string, string> Labels { get; set; }
        public PagedResult<IGrouping<DateTime, Reading>> Data { get; set; }

        public string GetLabel(string name)
        {
            if(Labels.ContainsKey(name))
            {
                return Labels[name];
            }

            return name;
        }
    }
}
