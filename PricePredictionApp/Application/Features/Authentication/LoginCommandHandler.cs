using Application.DTO.Authentication;
using Application.Enumerations;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Authentication
{
    public class LoginCommandHandler : IRequestHandler<LoginCommand, (AuthenticationStatus Status, LoginToken? Token, string? ErrorMessage)>
    {
        private readonly IAuthenticationManager authenticationManager;

        public LoginCommandHandler(IAuthenticationManager authenticationManager)
        {
            this.authenticationManager = authenticationManager;
        }
        public async Task<(AuthenticationStatus Status, LoginToken? Token, string? ErrorMessage)> Handle(LoginCommand request, CancellationToken cancellationToken)
        {
            if (request.LoginInfo == null)
            {
                throw new ArgumentNullException(nameof(request));
            }

            return await authenticationManager.Login(request.LoginInfo);
        }
    }
}
