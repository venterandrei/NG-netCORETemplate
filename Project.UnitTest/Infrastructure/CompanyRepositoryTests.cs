using Project.Core.Entities.General;
using Project.Infrastructure.Data;
using Project.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Moq;

namespace Project.UnitTest.Infrastructure
{
    public class CompanyRepositoryTests
    {
        private Mock<ApplicationDbContext> _dbContextMock;
        private CompanyRepository _companyRepository;

        [SetUp]
        public void Setup()
        {
            _dbContextMock = new Mock<ApplicationDbContext>(new DbContextOptions<ApplicationDbContext>());
            _companyRepository = new CompanyRepository(_dbContextMock.Object);
        }

        [Test]
        public async Task AddAsync_ValidCompany_ReturnsAddedCompany()
        {

            // Arrange
            var newCompany = new Company
            {
                Exchange = "P001",
                Name = "Sample Company",
                StockTicker = "Sample description",
                Isin = new Guid().ToString(),
                Website = "Sample description"
            };

            var companyDbSetMock = new Mock<DbSet<Company>>();

            _dbContextMock.Setup(db => db.Set<Company>())
                          .Returns(companyDbSetMock.Object);

            companyDbSetMock.Setup(dbSet => dbSet.AddAsync(newCompany, default))
                            .ReturnsAsync((EntityEntry<Company>)null);

            // Act
            var result = await _companyRepository.Create(newCompany, It.IsAny<CancellationToken>());


            // Assert
            Assert.NotNull(result);
            Assert.That(result, Is.EqualTo(newCompany));
        }

        // Add more test methods for other repository operations, such as GetByIdAsync, UpdateAsync, DeleteAsync, etc.
    }
}
