using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions;
using TemperatureStation.Web.Models.UserViewModels;

namespace TemperatureStation.Web.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class UsersController : Controller
    {
        private readonly ApplicationDbContext _dataContext;
        private readonly PageContext _pageContext;

        public UsersController(ApplicationDbContext dataContext, PageContext pageContext)
        {
            _dataContext = dataContext;
            _pageContext = pageContext;

            _pageContext.ActiveMenu = "Users";
        }

        public IActionResult Index()
        {
            _pageContext.Title = "Users";

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
                                   .Where(u => u.Id == id)
                                   .Select(u => new UserEditViewModel
                                   {
                                       Id = u.Id,
                                       UserName = u.UserName,
                                       Role = (u.Roles.FirstOrDefault() ?? new IdentityUserRole<string>()).RoleId
                                   })
                                   .FirstOrDefaultAsync();

            if(model == null)
            {
                _pageContext.Title = "User not found";
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
            model.AllRoles.Insert(0, new SelectListItem { Text = "", Value = "" });

            _pageContext.Title = "Edit user " + model.UserName;
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UserEditViewModel model)
        {
            if(!ModelState.IsValid)
            {
                _pageContext.Title = "Edit user " + model.UserName;
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

            var userRoles = _dataContext.UserRoles.Where(ur => ur.UserId == model.Id);
            foreach(var userRole in userRoles)
            {
                _dataContext.UserRoles.Remove(userRole);
            }

            if (!string.IsNullOrEmpty(model.Role))
            {
                user.Roles.Add(new IdentityUserRole<string> { RoleId = model.Role, UserId = model.Id });
            }

            await _dataContext.SaveChangesAsync();

            return RedirectToAction("Index");
        }

        private bool IsOnlyAdminAccount(string id)
        {
            throw new NotImplementedException();
        }
    }
}
