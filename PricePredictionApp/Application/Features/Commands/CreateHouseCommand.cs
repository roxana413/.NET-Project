using Application.DTO;
using MediatR;

namespace Application.Features.Commands
{
    public class CreateHouseCommand : IRequest<Guid>
    {
        public HouseDTO NewHouse { get; set; }
    }
}
