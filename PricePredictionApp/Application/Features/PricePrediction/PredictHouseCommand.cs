using Application.DTO;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.PricePrediction
{
    public class PredictHouseCommand : IRequest<HouseDTO>
    {
        public string? UserName { get; set; }
        public HouseDTO HouseForm { get; set; }
    }
}
