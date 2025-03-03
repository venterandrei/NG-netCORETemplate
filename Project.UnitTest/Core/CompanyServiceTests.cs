using Project.Core.Entities.Business;
using Project.Core.Entities.General;
using Project.Core.Interfaces.IMapper;
using Project.Core.Interfaces.IRepositories;
using Project.Core.Interfaces.IServices;
using Project.Core.Services;
using Moq;

namespace Project.UnitTest
{
    public class CompanyServiceTests
    {
        private Mock<IBaseMapper<Company, CompanyViewModel>> _companyViewModelMapperMock;
        private Mock<IBaseMapper<CompanyCreateViewModel, Company>> _companyCreateMapperMock;
        private Mock<IBaseMapper<CompanyUpdateViewModel, Company>> _companyUpdateMapperMock;
        private Mock<ICompanyRepository> _companyRepositoryMock;
       

        [SetUp]
        public void Setup()
        {
            _companyViewModelMapperMock = new Mock<IBaseMapper<Company, CompanyViewModel>>();
            _companyCreateMapperMock = new Mock<IBaseMapper<CompanyCreateViewModel, Company>>();
            _companyUpdateMapperMock = new Mock<IBaseMapper<CompanyUpdateViewModel, Company>>();
            _companyRepositoryMock = new Mock<ICompanyRepository>();
        }

        [Test]
        public async Task CreateCompanyAsync_ValidCompany_ReturnsCreatedCompanyViewModel()
        {
            // Arrange
            var companyService = new CompanyService(
                _companyViewModelMapperMock.Object,
                _companyCreateMapperMock.Object,
                _companyUpdateMapperMock.Object,
                _companyRepositoryMock.Object);

            var newCompanyCreateViewModel = new CompanyCreateViewModel
            {
                Exchange = "P001",
                Name = "Sample Company",
                StockTicker = "Sample description",
                Isin = new Guid().ToString(),
                Website = "Sample description"
            };

            var newCompanyViewModel = new CompanyViewModel
            {
                Exchange = "P001",
                Name = "Sample Company",
                StockTicker = "Sample description",
                Isin = new Guid().ToString(),
                Website = "Sample description"
            };

            var createdCompany = new Company
            {
                Exchange = "P001",
                Name = "Sample Company",
                StockTicker = "Sample description",
                Isin = new Guid().ToString(),
                Website = "Sample description"
            };

            _companyCreateMapperMock.Setup(mapper => mapper.MapModel(newCompanyCreateViewModel))
                              .Returns(createdCompany);

            _companyRepositoryMock.Setup(repo => repo.Create(createdCompany, It.IsAny<CancellationToken>()))
                                  .ReturnsAsync(createdCompany);

            _companyViewModelMapperMock.Setup(mapper => mapper.MapModel(createdCompany))
                                       .Returns(newCompanyViewModel);

            // Act
            var result = await companyService.Create(newCompanyCreateViewModel, It.IsAny<CancellationToken>());

            // Assert
            Assert.NotNull(result);
            Assert.That(result.Name, Is.EqualTo(newCompanyViewModel.Name));
            // Additional assertions for other properties
        }
    }

}