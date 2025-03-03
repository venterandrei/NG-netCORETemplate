using System.ComponentModel.DataAnnotations;

namespace Project.Core.Entities.Business
{
    public class CompanyViewModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string Exchange { get; set; }
        public string StockTicker { get; set; }
        public string Isin { get; set; }
        public string Website { get; set; }
    }

    public class CompanyCreateViewModel
    {

        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string? Name { get; set; }
        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string Exchange { get; set; }

        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string StockTicker { get; set; }

        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string Isin { get; set; }

        public string Website { get; set; }
    }

    public class CompanyUpdateViewModel
    {
        public int Id { get; set; }
        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
      
        public string? Name { get; set; }
        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string Exchange { get; set; }

        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string StockTicker { get; set; }

        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string Isin { get; set; }

        public string Website { get; set; }
    }
}
