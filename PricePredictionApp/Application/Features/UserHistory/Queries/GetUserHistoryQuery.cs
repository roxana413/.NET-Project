using Application.DTO;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.UserHistory.Queries
{
    public class GetUserHistoryQuery : IRequest<IEnumerable<HouseDTO>>
    {
        public string? UserName { get; set; }
    }
}
