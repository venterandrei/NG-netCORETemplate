using Project.API.Middlewares;
using Project.Core.Interfaces.IRepositories;
using Project.Core.Interfaces.IServices;
using Project.Core.Services;
using Project.Infrastructure.Repositories;

namespace Project.API.Extensions
{
    public static class ServiceExtension
    {
        public static IServiceCollection RegisterService(this IServiceCollection services)
        {
            #region Services
            services.AddSingleton<IUserContext, UserContext>();
            services.AddScoped<ICompanyService, CompanyService>();
            services.AddScoped<IAuthService, AuthService>();

            #endregion

            #region Repositories
            services.AddTransient<ICompanyRepository, CompanyRepository>();
            services.AddTransient<IAuthRepository, AuthRepository>();

            #endregion

            return services;
        }
    }
}
