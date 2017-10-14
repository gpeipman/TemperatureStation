using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using TemperatureStation.Web.Calculators;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Models
{
    public class HomeViewModel
    {
        public Measurement Measurement { get; set; }
        public IList<KeyValuePair<DateTime, IList<ReadingViewModel>>> Readings { get; set; }
        public IList<KeyValuePair<DateTime, IList<ReadingViewModel>>> ChartData { get; set; }
        public string[] CalculatorsOnChart { get; set; }
        public IDictionary<string,string> Labels { get; set; }
        public IDictionary<string, ICalculator> Calculators { get; set; }
        public IDictionary<string, Tuple<double, double>> Statistics { get; set; }
        public IEnumerable<SelectListItem> Measurements { get; set; }

        public HomeViewModel()
        {
            Readings = new List<KeyValuePair<DateTime, IList<ReadingViewModel>>>();
            CalculatorsOnChart = new string[] { };
            Labels = new Dictionary<string, string>();
            Measurements = new List<SelectListItem>();
        }
    }
}
