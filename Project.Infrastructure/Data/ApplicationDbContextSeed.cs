using Bogus;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Project.Core.Entities.General;

namespace Project.Infrastructure.Data
{
    public class ApplicationDbContextSeed
    {
        public static async Task SeedAsync(IServiceProvider serviceProvider, ILoggerFactory loggerFactory, int? retry = 0)
        {
            int retryForAvailability = retry ?? 0;
            var appContext = serviceProvider.GetRequiredService<ApplicationDbContext>();
            try
            {

                // Adding Companies
                if (!appContext.Companies.Any())
                {
                    using (var transaction = appContext.Database.BeginTransaction())
                    {
                        appContext.Companies.AddRange(Companies());
                        await appContext.SaveChangesAsync();
                        transaction.Commit();
                    }
                }

            }
            catch (Exception ex)
            {
                if (retryForAvailability < 10)
                {
                    retryForAvailability++;
                    var log = loggerFactory.CreateLogger<ApplicationDbContextSeed>();
                    log.LogError(ex.Message);
                    await SeedAsync(serviceProvider, loggerFactory, retryForAvailability);
                }
            }
        }

        /************* Prerequisite for Start Application ********/

       

        static IEnumerable<Company> Companies()
        {
            var faker = new Faker<Company>()
                
                .RuleFor(c => c.Name, f => f.Commerce.ProductName())
                .RuleFor(c => c.Exchange, f => f.Commerce.ProductName())
                .RuleFor(c => c.StockTicker, f => f.Commerce.ProductName())
                .RuleFor(c => c.Isin, f => f.Commerce.Ean13())
                .RuleFor(c => c.Website, f => f.Commerce.Random.Words());

            return faker.Generate(100);

        }

    }
}
