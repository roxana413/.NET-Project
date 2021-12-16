using Application.DTO.Authentication;
using Application.Enumerations;
using MediatR;

namespace Application.Features.Authentication
{
    public class LoginCommand : IRequest<(AuthenticationStatus Status, LoginToken? Token, string? ErrorMessage)>
    {
        public LoginModel? LoginInfo { get; set; }
    }
}
