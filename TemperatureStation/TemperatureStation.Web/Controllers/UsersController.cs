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
using TemperatureStation.Web.Models;
using TemperatureStation.Web.Models.UserViewModels;

namespace TemperatureStation.Web.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class UsersController : Controller
    {
        private readonly ApplicationDbContext _dataContext;
        private readonly PageContext _pageContext;
        private readonly UserManager<ApplicationUser> _userManager;

        public UsersController(ApplicationDbContext dataContext,
                               UserManager<ApplicationUser> userManager,
                               PageContext pageContext)
        {
            _dataContext = dataContext;
            _userManager = userManager;
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
                                   .Include(u => u.Roles)
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

            var user = await _dataContext.Users.Include(u => u.Roles).FirstOrDefaultAsync(u => u.Id == model.Id);

            if (user.Roles.FirstOrDefault()?.RoleId == model.Role)
            {
                return RedirectToAction("Index");
            }

            user.Roles.Clear();
            
            if (!string.IsNullOrEmpty(model.Role))
            {
                var userRole = _dataContext.UserRoles.FirstOrDefault(ur => ur.UserId == model.Id && ur.RoleId == model.Role);
                if(userRole == null)
                {
                    userRole = new IdentityUserRole<string> { RoleId = model.Role, UserId = model.Id };
                }
                user.Roles.Add(userRole);
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
