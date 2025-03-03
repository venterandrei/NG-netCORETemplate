using Project.Core.Entities.General;

namespace Project.Core.Interfaces.IRepositories
{
    public interface ICompanyRepository : IBaseRepository<Company>
    {
        Task<IList<Company>> GetByLsin(string lsin, CancellationToken cancellationToken);
    }
}
