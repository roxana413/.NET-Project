using Application.DTO;
using MediatR;

namespace Application.Features.Users.Queries
{
    public class GetUserByName : IRequest<UserDTO>
    {
        public string? UserName { get; set; }
    }
}
