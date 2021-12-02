using Application.Interfaces;
using Domain.Entities;
using MediatR;

namespace Application.Features.Queries
{
    public class GetHousesQueryHandler : IRequestHandler<GetHousesQuery, IEnumerable<House>>
    {
        private readonly IHouseRepository repository;

        public GetHousesQueryHandler(IHouseRepository repository)
        {
            this.repository = repository;
        }
        public async Task<IEnumerable<House>> Handle(GetHousesQuery request, CancellationToken cancellationToken)
        {
            return await repository.GetAllAsync();
        }
    }
}
