using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Models;

namespace TemperatureStation.Web.Controllers
{
    public class UsersController : Controller
    {
        private readonly ApplicationDbContext _dataContext;

        public UsersController(ApplicationDbContext dataContext)
        {
            _dataContext = dataContext;
        }

        public IActionResult Index()
        {
            var model = _dataContext.Users
                                    .OrderBy(u => u.UserName)
                                    .ToList();
            return View(model);
        }

        public async Task<IActionResult> Edit(string id)
        {
            var model = await _dataContext.Users
                                   .Select(u => new UserEditViewModel
                                   {
                                       Id = u.Id,
                                       UserName = u.UserName,
                                       Roles = u.Roles.Select(r => r.RoleId).ToArray()
                                   })
                                   .FirstOrDefaultAsync();

            if(model == null)
            {
                return NotFound();
            }

            model.AllRoles = await _dataContext
                                        .Roles
                                        .Select(r => new SelectListItem
                                        {
                                            Value = r.Id,
                                            Text = r.Name,
                                            Selected = model.Roles.Contains(r.Id)
                                        })
                                        .ToListAsync();                                        

            return View(model);
        }

        private bool IsOnlyAdminAccount(string id)
        {
            throw new NotImplementedException();
        }
    }
}
