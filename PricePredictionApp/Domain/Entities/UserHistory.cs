using Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class UserHistory : BaseEntity
    {
        public string UserId { get; set; }
        public List<House> CreatedHouses { get; set; } = new List<House>();
    }
}
