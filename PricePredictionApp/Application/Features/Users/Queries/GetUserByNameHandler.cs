using Application.DTO;
using Application.Interfaces;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
            return await usersManager.GetUserByName(request.UserName);
        }
    }
}
