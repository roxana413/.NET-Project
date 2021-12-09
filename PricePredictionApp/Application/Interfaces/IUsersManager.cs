using Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IUsersManager
    {
        Task<IEnumerable<UserDTO>> GetUsers();
        Task<UserDTO> GetUserByName(string userName);
        Task<string?> GetUserIdByName(string userName);
    }
}
