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
using TemperatureStation.Web.Extensions;

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

            services.AddSingleton<ICalculatorProvider, CalculatorProvider>();
            services.AddTransient<DummyCalculator, DummyCalculator>();
            services.AddTransient<HeatExchangeRateCalculator, HeatExchangeRateCalculator>();

            services.AddTransient<IEmailSender, AuthMessageSender>();
            services.AddTransient<ISmsSender, AuthMessageSender>();
            services.AddSingleton<IConfiguration>(Configuration);
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
                cfg.CreateMap<SensorReading, ReadingViewModel>()
                   .ForMember(r => r.Source, m => m.MapFrom(r => r.SensorRole.RoleName));
                cfg.CreateMap<CalculatorReading, ReadingViewModel>()
                   .ForMember(r => r.Source, m => m.MapFrom(r => r.Calculator.Name));
                cfg.CreateMap<Reading, ReadingViewModel>()
                   .ForMember(r => r.Source, m => m.ResolveUsing(r =>
                   {
                       if (r is SensorReading)
                       {
                           return ((SensorReading)r).SensorRole.RoleName;
                       }
                       else if (r is CalculatorReading)
                       {
                           return ((CalculatorReading)r).Calculator.Name;
                       }

                       return "<unknown>";
                   }));
                cfg.CreateMap<Calculator, CalculatorEditViewModel>();
                cfg.CreateMap<CalculatorEditViewModel, Calculator>()
                   .ForMember(m => m.Id, m => m.Ignore())
                   .ForMember(m => m.Measurement, m => m.Ignore());
                
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
