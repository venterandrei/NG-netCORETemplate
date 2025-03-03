using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace Project.Core.Entities.General
{
    //Base class for entities common properties
    public class Base
    {
        [Key]
        public int Id { get; set; }
       
    }
}
