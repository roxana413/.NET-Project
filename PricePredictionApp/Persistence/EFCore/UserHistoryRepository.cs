using Application.DTO;
using Application.Interfaces;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.EFCore
{
    public class UserHistoryRepository : Repository<UserHistory>, IUserHistoryRepository
    {
        public UserHistoryRepository(DataContext context) : base(context)
        {
        }

        public async Task<House> AddHouseAsync(string userId, House createdHouse)
        {
            var userHistory = await context.UserHistory
                .Include(uh => uh.CreatedHouses)
                .Where(uh => uh.UserId == userId)
                .FirstOrDefaultAsync();
            userHistory.CreatedHouses.Add(createdHouse);
            await context.SaveChangesAsync();

            return createdHouse;
        }


        public async Task<IEnumerable<HouseDTO>> GetAllHousesAsync(string userId)
        {
            var userHistory = await context.UserHistory
                .Include(uh => uh.CreatedHouses)
                .Where(uh => uh.UserId == userId)
                .FirstOrDefaultAsync();

            var userHouses = userHistory.CreatedHouses
                .Select(uh => new HouseDTO()
                {
                    DateSold = uh.DateSold,
                    Price = uh.Price,
                    Bedrooms = uh.Bedrooms,
                    Bathrooms = uh.Bathrooms,
                    LivingArea = uh.LivingArea,
                    LotArea = uh.LotArea,
                    Floors = uh.Floors,
                    Waterfront = uh.Waterfront,
                    View = uh.View,
                    Condition = uh.Condition,
                    Grade = uh.Grade,
                    AboveArea = uh.AboveArea,
                    BasementArea = uh.BasementArea,
                    YearBuilt = uh.YearBuilt,
                    YearRenovated = uh.YearRenovated,
                    Zipcode = uh.Zipcode
                })
                .ToList();

            return userHouses;
        }
    }
}
