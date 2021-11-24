using Domain.Entities;
using MediatR;

namespace Application.Features.Commands
{
    public class UpdateHouseCommand : IRequest<Guid>
    {
        public House UpdatedHouse { get; set; }    
    }
}
