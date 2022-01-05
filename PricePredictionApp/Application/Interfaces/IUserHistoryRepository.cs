using Application.DTO;
using Domain.Entities;

namespace Application.Interfaces
{
    public interface IUserHistoryRepository : IRepository<UserHistory>
    {
        Task<IEnumerable<HouseDTO>> GetAllHousesAsync(string userId);
        Task<House> AddHouseAsync(string userId, House createdHouse);
    }
}
