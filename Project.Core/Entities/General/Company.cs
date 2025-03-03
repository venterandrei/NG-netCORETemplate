using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Project.Core.Entities.General
{
    [Table("Companies")]
    public class Company : Base
    {
        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string Name { get; set; }
        [Required, StringLength(maximumLength: 8, MinimumLength = 2)]
        public string Exchange { get; set; }

        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string StockTicker { get; set; }

        [Required, StringLength(maximumLength: 100, MinimumLength = 2)]
        public string Isin { get; set; }

        public string Website { get; set; }


    }
}
