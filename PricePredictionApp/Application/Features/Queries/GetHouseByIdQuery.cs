using Domain.Entities;
using MediatR;

namespace Application.Features.Queries
{
    public class GetHouseByIdQuery : IRequest<House>
    {
        public Guid Id { get; set; }
    }
}
