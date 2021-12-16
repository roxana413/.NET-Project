using Application.Constants;
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
            int pageIndex = (int)(request.PageIndex == null ? PaginationConstants.PageIndex : request.PageIndex);
            int pageSize = (int)(request.PageSize == null || request.PageSize == 0 ? PaginationConstants.PageSize : request.PageSize);

            return await repository.GetAllAsync(pageIndex, pageSize);
        }
    }
}
