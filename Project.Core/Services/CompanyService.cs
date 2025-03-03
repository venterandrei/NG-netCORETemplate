using Project.Core.Entities.Business;
using Project.Core.Entities.General;
using Project.Core.Interfaces.IMapper;
using Project.Core.Interfaces.IRepositories;
using Project.Core.Interfaces.IServices;

namespace Project.Core.Services
{
    public class CompanyService : BaseService<Company, CompanyViewModel>, ICompanyService
    {
        private readonly IBaseMapper<Company, CompanyViewModel> _companyViewModelMapper;
        private readonly IBaseMapper<CompanyCreateViewModel, Company> _companyCreateMapper;
        private readonly IBaseMapper<CompanyUpdateViewModel, Company> _companyUpdateMapper;
        private readonly ICompanyRepository _companyRepository;

        public CompanyService(
            IBaseMapper<Company, CompanyViewModel> companyViewModelMapper,
            IBaseMapper<CompanyCreateViewModel, Company> companyCreateMapper,
            IBaseMapper<CompanyUpdateViewModel, Company> companyUpdateMapper,
            ICompanyRepository companyRepository)
            : base(companyViewModelMapper, companyRepository)
        {
            _companyCreateMapper = companyCreateMapper;
            _companyUpdateMapper = companyUpdateMapper;
            _companyViewModelMapper = companyViewModelMapper;
            _companyRepository = companyRepository;
           
        }

        public async Task<CompanyViewModel> Create(CompanyCreateViewModel model, CancellationToken cancellationToken)
        {
            //Mapping through AutoMapper
            var entity = _companyCreateMapper.MapModel(model);
           

            return _companyViewModelMapper.MapModel(await _companyRepository.Create(entity, cancellationToken));
        }

        public async Task Update(CompanyUpdateViewModel model, CancellationToken cancellationToken)
        {
            var existingData = await _companyRepository.GetById(model.Id, cancellationToken);

            //Mapping through AutoMapper
            _companyUpdateMapper.MapModel(model, existingData);

            
            await _companyRepository.Update(existingData, cancellationToken);
        }

        public async Task Delete(int id, CancellationToken cancellationToken)
        {
            var entity = await _companyRepository.GetById(id, cancellationToken);
            await _companyRepository.Delete(entity, cancellationToken);
        }
        public async Task<IEnumerable<CompanyViewModel>> GetByLsin(string lsin, CancellationToken cancellationToken)
        {
            return _companyViewModelMapper.MapList(await _companyRepository.GetByLsin(lsin, cancellationToken));
        }

    }
}
