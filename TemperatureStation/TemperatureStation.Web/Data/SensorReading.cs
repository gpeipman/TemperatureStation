﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TemperatureStation.Web.Data
{
    public class SensorReading : Reading
    {
        [Required]
        public SensorRole SensorRole { get; set; }
    }
}
