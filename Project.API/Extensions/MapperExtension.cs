using AutoMapper;
using Project.Core.Entities.Business;
using Project.Core.Entities.General;
using Project.Core.Interfaces.IMapper;
using Project.Core.Mapper;

namespace Project.API.Extensions
{
    public static class MapperExtension
    {
        public static IServiceCollection RegisterMapperService(this IServiceCollection services)
        {

            #region Mapper

            services.AddSingleton<IMapper>(sp => new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Company, CompanyViewModel>();
                cfg.CreateMap<CompanyCreateViewModel, Company>();
                cfg.CreateMap<CompanyUpdateViewModel, Company>();

               

            }).CreateMapper());

            // Register the IMapperService implementation with your dependency injection container
            services.AddSingleton<IBaseMapper<Company, CompanyViewModel>, BaseMapper<Company, CompanyViewModel>>();
            services.AddSingleton<IBaseMapper<CompanyCreateViewModel, Company>, BaseMapper<CompanyCreateViewModel, Company>>();
            services.AddSingleton<IBaseMapper<CompanyUpdateViewModel, Company>, BaseMapper<CompanyUpdateViewModel, Company>>();

          

            #endregion

            return services;
        }
    }
}
