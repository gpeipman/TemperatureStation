using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace TemperatureStation.Web.Models
{
    public class ApplicationUser : IdentityUser
    {
        public virtual ICollection<IdentityUserRole<string>> Roles { get; } = new List<IdentityUserRole<string>>();
    }
}
