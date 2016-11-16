using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Models;
using TemperatureStation.Web.Models.MeasurementViewModels;
using TemperatureStation.Web.Services;

namespace TemperatureStation.Web
{
    public class Startup
    {
        public IConfigurationRoot Configuration { get; }

        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true);

            if (env.IsDevelopment())
            {
                builder.AddUserSecrets();
            }

            builder.AddEnvironmentVariables();
            Configuration = builder.Build();

            DefineMappings();
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();

            services.AddMvc();

            services.AddTransient<IEmailSender, AuthMessageSender>();
            services.AddTransient<ISmsSender, AuthMessageSender>();

            services.AddSingleton<Microsoft.Extensions.Configuration.IConfiguration>(Configuration);
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseDatabaseErrorPage();
                app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseIdentity();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }

        private void DefineMappings()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Measurement, MeasurementListItemViewModel>();
                cfg.CreateMap<Measurement, MeasurementEditViewModel>();
                cfg.CreateMap<SensorRole, SensorRoleViewModel>();
                cfg.CreateMap<SensorRole, SensorRoleEditViewModel>();
                cfg.CreateMap<Reading, ReadingViewModel>();

                cfg.CreateMap<MeasurementEditViewModel, Measurement>()
                   .ForMember(m => m.Id, m => m.Ignore())
                   .ForMember(m => m.SensorRoles, m => m.Ignore());

                cfg.CreateMap<SensorRoleEditViewModel, SensorRole>()
                   .ForMember(m => m.Id, m => m.Ignore())
                   .ForMember(m => m.Sensor, m => m.Ignore())
                   .ForMember(m => m.Measurement, m => m.Ignore());
            });
        }
    }
}
