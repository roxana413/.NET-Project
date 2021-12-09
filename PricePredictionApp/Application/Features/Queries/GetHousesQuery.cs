using Domain.Entities;
using MediatR;

namespace Application.Features.Queries
{
    public class GetHousesQuery : IRequest<IEnumerable<House>>
    {
        public int? PageIndex { get; set; }
        public int? PageSize { get; set; }
    }
}
