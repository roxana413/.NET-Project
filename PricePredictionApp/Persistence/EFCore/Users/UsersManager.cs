using Application.DTO;
using Application.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Persistence.EFCore.Users
{
    public class UsersManager : IUsersManager
    {
        private readonly UserManager<IdentityUser> userManager;
        private readonly DataContext context;

        public UsersManager(UserManager<IdentityUser> userManager, DataContext context)
        {
            this.userManager = userManager;
            this.context = context;
        }

        public async Task<IEnumerable<UserDTO>> GetUsers()
        {
            var users = await context.Users.Select(user => new UserDTO
            {
                UserName = user.UserName,
                Password = user.PasswordHash,
                Email = user.Email
            }).ToListAsync();
            return users;
        }

        public async Task<UserDTO> GetUserByName(string userName)
        {
            var currentUser = await userManager.FindByNameAsync(userName);
            var user = await context.Users.Select(user => new UserDTO
            {
                UserName = user.UserName,
                Password = user.PasswordHash,
                Email = user.Email
            }).SingleOrDefaultAsync(user => user.UserName == currentUser.UserName);

            return user;
        }

        public async Task<string?> GetUserIdByName(string userName)
        {
            var currentUser = await userManager.FindByNameAsync(userName);
            if (currentUser == null)
            {
                return null;
            }

            return currentUser.Id;
        }
    }
}
