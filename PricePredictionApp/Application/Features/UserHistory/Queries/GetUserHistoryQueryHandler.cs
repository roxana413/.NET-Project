using Application.DTO;
using Application.Exceptions;
using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.UserHistory.Queries
{
    public class GetUserHistoryQueryHandler : IRequestHandler<GetUserHistoryQuery, IEnumerable<HouseDTO>>
    {
        private readonly IUsersManager usersManager;
        private readonly IUserHistoryRepository userHistoryRepository;
        private readonly IHouseRepository houseRepository;

        public GetUserHistoryQueryHandler(IUsersManager usersManager, IUserHistoryRepository userHistoryRepository, IHouseRepository houseRepository)
        {
            this.usersManager = usersManager;
            this.userHistoryRepository = userHistoryRepository;
            this.houseRepository = houseRepository;
        }
        public async Task<IEnumerable<HouseDTO>> Handle(GetUserHistoryQuery request, CancellationToken cancellationToken)
        {
            var userId = await usersManager.GetUserIdByName(request.UserName);
            if (userId == null)
            {
                throw new EntityNotFoundException("User does not exist.");
            }

            return await userHistoryRepository.GetAllHousesAsync(userId);
        }
    }
}
