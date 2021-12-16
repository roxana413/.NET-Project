using Application.DTO;
using MediatR;

namespace Application.Features.Users.Queries
{
    public class GetUsersQuery : IRequest<IEnumerable<UserDTO>>
    {
    }
}
