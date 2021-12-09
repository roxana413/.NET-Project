using Application.Interfaces;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Persistence.EFCore
{
    public class HouseRepository : Repository<House>, IHouseRepository
    {
        public HouseRepository(DataContext context) : base(context)
        {
        }

        public override async Task<IEnumerable<House>> GetAllAsync(int pageIndex, int pageSize)
        {
            return await context.Houses
                .OrderByDescending(h => h.DateSold)
                .Skip(pageIndex * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }
    }
}
