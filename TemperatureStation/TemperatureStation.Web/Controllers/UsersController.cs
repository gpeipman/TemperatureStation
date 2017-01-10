using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Models.UserViewModels;

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
                                    .Select(u => new UserListViewModel
                                    {
                                        Id = u.Id,
                                        UserName = u.UserName,
                                        Role = (u.Roles.FirstOrDefault() ?? new IdentityUserRole<string>()).RoleId
                                    })
                                    .ToList();
            return View(model);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(string id)
        {
            var model = await _dataContext.Users
                                   .Select(u => new UserEditViewModel
                                   {
                                       Id = u.Id,
                                       UserName = u.UserName,
                                       Role = (u.Roles.FirstOrDefault() ?? new IdentityUserRole<string>()).RoleId
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
                                            Selected = (r.Id == model.Role)
                                        })
                                        .ToListAsync();                                        

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UserEditViewModel model)
        {
            if(!ModelState.IsValid)
            {
                return View(model);
            }

            if (string.IsNullOrEmpty(model.Id))
            {
                ModelState.AddModelError("Id", "User id cannot be empty");
                return View(model);
            }

            var user = await _dataContext.Users.FirstOrDefaultAsync(u => u.Id == model.Id);
            if(user == null)
            {
                ModelState.AddModelError("Id", "Cannot find user");
                return View(model);
            }

            if(user.Roles.FirstOrDefault()?.RoleId == model.Role)
            {
                return RedirectToAction("Index");
            }

            user.Roles.Clear();
            user.Roles.Add(new IdentityUserRole<string> { RoleId = model.Role, UserId = model.Id });
            await _dataContext.SaveChangesAsync();

            return RedirectToAction("Index");
        }

        private bool IsOnlyAdminAccount(string id)
        {
            throw new NotImplementedException();
        }
    }
}
