using Domain.Entities;
using MediatR;

namespace Application.Features.Queries
{
    public class GetHousesQuery : IRequest<IEnumerable<House>>
    {
    }
}
