﻿using Microsoft.AspNetCore.Mvc;

namespace TemperatureStation.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View(); 
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}