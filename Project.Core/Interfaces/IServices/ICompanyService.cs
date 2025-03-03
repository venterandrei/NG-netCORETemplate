using Project.Core.Entities.Business;
using Project.Core.Entities.General;

namespace Project.Core.Interfaces.IServices
{
    public interface ICompanyService : IBaseService<CompanyViewModel>
    {
        Task<CompanyViewModel> Create(CompanyCreateViewModel model, CancellationToken cancellationToken);
        Task Update(CompanyUpdateViewModel model, CancellationToken cancellationToken);
        Task Delete(int id, CancellationToken cancellationToken);
        Task<IEnumerable<CompanyViewModel>> GetByLsin(string lsin, CancellationToken cancellationToken);
    }
}
