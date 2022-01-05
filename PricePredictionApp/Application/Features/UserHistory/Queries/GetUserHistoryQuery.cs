using Application.DTO;
using MediatR;

namespace Application.Features.UserHistory.Queries
{
    public class GetUserHistoryQuery : IRequest<IEnumerable<HouseDTO>>
    {
        public string? UserName { get; set; }
    }
}
