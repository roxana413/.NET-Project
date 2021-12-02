using Application.DTO.Authentication;
using Application.Enumerations;

namespace Application.Interfaces
{
    public interface IAuthenticationManager
    {
        public Task<(AuthenticationStatus Status, string? ErrorMessage)> Register(RegisterModel registerModel);

        public Task<(AuthenticationStatus Status, LoginToken? Token, string? ErrorMessage)> Login(LoginModel loginModel);
    }
}
