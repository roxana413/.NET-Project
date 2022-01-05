using Domain.Common;

namespace Domain.Entities
{
    public class UserHistory : BaseEntity
    {
        public string? UserId { get; set; }
        public List<House> CreatedHouses { get; set; } = new List<House>();
    }
}
