using Application.DTO.Authentication;
using Application.Enumerations;
using MediatR;

namespace Application.Features.Authentication
{
    public class RegisterCommand : IRequest<(AuthenticationStatus Status, string? ErrorMessage)>
    {
        public RegisterModel RegisterInfo { get; set; }
    }
}
