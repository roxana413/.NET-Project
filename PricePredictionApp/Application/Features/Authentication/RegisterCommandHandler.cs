using Application.Enumerations;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Authentication
{
    public class RegisterCommandHandler : IRequestHandler<RegisterCommand, (AuthenticationStatus Status, string? ErrorMessage)>
    {
        private readonly IAuthenticationManager authenticationManager;

        public RegisterCommandHandler(IAuthenticationManager authenticationManager)
        {
            this.authenticationManager = authenticationManager;
        }
        public async Task<(AuthenticationStatus Status, string? ErrorMessage)> Handle(RegisterCommand request, CancellationToken cancellationToken)
        {
            return await authenticationManager.Register(request.RegisterInfo);
        }
    }
}
