using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Commands
{
    public class UpdateHouseCommand : IRequest<Guid>
    {
        public House UpdatedHouse { get; set; }    
    }
}
