using Project.API.Controllers.V1;
using Project.Core.Entities.Business;
using Project.Core.Interfaces.IServices;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;
using Bogus.DataSets;
using Microsoft.Extensions.Caching.Memory;

namespace Project.UnitTest.API
{
    public class CompanyControllerTests
    {
        private Mock<ICompanyService> _companyServiceMock;
        private Mock<ILogger<CompanyController>> _loggerMock;
        private CompanyController _companyController;
        private Mock<IMemoryCache> _memoryCacheMock;

        [SetUp]
        public void Setup()
        {
            _companyServiceMock = new Mock<ICompanyService>();
            _loggerMock = new Mock<ILogger<CompanyController>>();
            _memoryCacheMock = new Mock<IMemoryCache>();
            _companyController = new CompanyController(_loggerMock.Object, _companyServiceMock.Object, _memoryCacheMock.Object);
        }

        [Test]
        public async Task Get_ReturnsViewWithListOfCompanies()
        {
            // Arrange
            var companies = new List<CompanyViewModel>
            {
                new CompanyViewModel { Id = 1, Exchange = "P001", Name = "Company A", StockTicker = "Sample description", Isin = new Guid().ToString(),Website = "www" },
                new CompanyViewModel { Id = 2, Exchange = "P002", Name = "Company B", StockTicker = "Sample description", Isin = new Guid().ToString(),Website = "www" }
            };

            _companyServiceMock.Setup(service => service.GetAll(It.IsAny<CancellationToken>()))
                      .ReturnsAsync(companies);

            // Act
            var result = await _companyController.Get(It.IsAny<CancellationToken>());

            // Assert
            Assert.IsInstanceOf<OkObjectResult>(result);
            var okObjectResult = (OkObjectResult)result;
            Assert.NotNull(okObjectResult);

            var model = (IEnumerable<CompanyViewModel>)okObjectResult.Value;
            Assert.NotNull(model);
            Assert.That(model.Count(), Is.EqualTo(companies.Count));

        }

        // Add more test methods for other controller actions, such as Create, Update, Delete, etc.

    }
}
