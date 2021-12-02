using Application.Interfaces;
using Domain.Entities;

namespace Persistence.EFCore
{
    public class HouseRepository : Repository<House>, IHouseRepository
    {
        public HouseRepository(DataContext context) : base(context)
        {
        }
    }
}
