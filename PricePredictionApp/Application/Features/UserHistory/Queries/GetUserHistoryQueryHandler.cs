using Application.DTO;
using Application.Exceptions;
using Application.Interfaces;
using MediatR;

namespace Application.Features.UserHistory.Queries
{
    public class GetUserHistoryQueryHandler : IRequestHandler<GetUserHistoryQuery, IEnumerable<HouseDTO>>
    {
        private readonly IUsersManager usersManager;
        private readonly IUserHistoryRepository userHistoryRepository;

        public GetUserHistoryQueryHandler(IUsersManager usersManager, IUserHistoryRepository userHistoryRepository)
        {
            this.usersManager = usersManager;
            this.userHistoryRepository = userHistoryRepository;
        }
        public async Task<IEnumerable<HouseDTO>> Handle(GetUserHistoryQuery request, CancellationToken cancellationToken)
        {
            ArgumentNullException.ThrowIfNull(request.UserName, nameof(request));

            var userId = await usersManager.GetUserIdByName(request.UserName);
            if (userId == null)
            {
                throw new EntityNotFoundException("User does not exist.");
            }

            return await userHistoryRepository.GetAllHousesAsync(userId);
        }
    }
}
