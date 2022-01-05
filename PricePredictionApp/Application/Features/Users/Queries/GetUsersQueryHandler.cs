using Application.DTO;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Users.Queries
{
    public class GetUsersQueryHandler : IRequestHandler<GetUsersQuery, IEnumerable<UserDTO>>
    {
        private readonly IUsersManager usersManager;

        public GetUsersQueryHandler(IUsersManager usersManager)
        {
            this.usersManager = usersManager;
        }
        public async Task<IEnumerable<UserDTO>> Handle(GetUsersQuery request, CancellationToken cancellationToken)
        {
            return await usersManager.GetUsers();
        }
    }
}
