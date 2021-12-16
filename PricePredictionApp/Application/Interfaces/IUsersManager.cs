using Application.DTO;

namespace Application.Interfaces
{
    public interface IUsersManager
    {
        Task<IEnumerable<UserDTO>> GetUsers();
        Task<UserDTO> GetUserByName(string userName);
        Task<string?> GetUserIdByName(string userName);
    }
}
