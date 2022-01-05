using Application.DTO;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Users.Queries
{
    public class GetUserByNameHandler : IRequestHandler<GetUserByName, UserDTO>
    {
        private readonly IUsersManager usersManager;

        public GetUserByNameHandler(IUsersManager usersManager)
        {
            this.usersManager = usersManager;
        }
        public async Task<UserDTO> Handle(GetUserByName request, CancellationToken cancellationToken)
        {
            ArgumentNullException.ThrowIfNull(request.UserName, nameof(request));
            
            return await usersManager.GetUserByName(request.UserName);
        }
    }
}
