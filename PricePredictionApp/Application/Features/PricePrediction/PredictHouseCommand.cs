using Application.DTO;
using MediatR;

namespace Application.Features.PricePrediction
{
    public class PredictHouseCommand : IRequest<HouseDTO>
    {
        public string? UserName { get; set; }
        public HouseDTO? HouseForm { get; set; }
    }
}
