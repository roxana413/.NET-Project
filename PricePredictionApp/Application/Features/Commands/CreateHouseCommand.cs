using Application.DTO;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Commands
{
    public class CreateHouseCommand : IRequest<Guid>
    {
        public HouseDTO NewHouse { get; set; }
    }
}
