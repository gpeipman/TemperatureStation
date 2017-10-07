using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace TemperatureStation.Web.Extensions.Components
{
    public class PagerViewComponent : ViewComponent
    {
        public Task<IViewComponentResult> InvokeAsync(PagedResultBase result)
        {
            return Task.FromResult((IViewComponentResult)View("Default", result));
        }
    }
}