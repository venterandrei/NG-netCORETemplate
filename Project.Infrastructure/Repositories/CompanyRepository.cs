using Project.Core.Entities.General;
using Project.Core.Interfaces.IRepositories;
using Project.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Project.Infrastructure.Repositories
{
    public class CompanyRepository : BaseRepository<Company>, ICompanyRepository
    {
        public CompanyRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
        }

        public async Task<IList<Company>> GetByLsin(string lsin, CancellationToken cancellationToken) {

            var company = await _dbContext.Companies
                   .Where(x => x.Isin.ToLower().Contains(lsin.ToLower()))
                   .ToListAsync(cancellationToken);
            return company;
        }

    }
}
