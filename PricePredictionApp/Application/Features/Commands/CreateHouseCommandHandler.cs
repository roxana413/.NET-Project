using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Commands
{
    public class CreateHouseCommandHandler : IRequestHandler<CreateHouseCommand, Guid>
    {
        private readonly IHouseRepository repository;

        public CreateHouseCommandHandler(IHouseRepository repository)
        {
            this.repository = repository;
        }
        public async Task<Guid> Handle(CreateHouseCommand request, CancellationToken cancellationToken)
        {
            House createdHouse = new House
            {
                DateSold = request.NewHouse.DateSold,
                Price = request.NewHouse.Price,
                Bedrooms = request.NewHouse.Bedrooms,
                Bathrooms = request.NewHouse.Bathrooms,
                LivingArea = request.NewHouse.LivingArea,
                LotArea = request.NewHouse.LotArea,
                Floors = request.NewHouse.Floors,
                Waterfront = request.NewHouse.Waterfront,
                View = request.NewHouse.View,
                Condition = request.NewHouse.Condition,
                Grade = request.NewHouse.Grade,
                AboveArea = request.NewHouse.AboveArea,
                BasementArea = request.NewHouse.BasementArea,
                YearBuilt = request.NewHouse.YearBuilt,
                YearRenovated = request.NewHouse.YearRenovated,
                Zipcode = request.NewHouse.Zipcode
            };

            await repository.AddAsync(createdHouse);
            return createdHouse.Id;
        }


    }
}
