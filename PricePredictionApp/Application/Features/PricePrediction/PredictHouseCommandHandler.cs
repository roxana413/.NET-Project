using Application.DTO;
using Application.Exceptions;
using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.PricePrediction
{
    public class PredictHouseCommandHandler : IRequestHandler<PredictHouseCommand, HouseDTO>
    {
        private readonly IUsersManager usersManager;
        private readonly IHouseRepository houseRepository;
        private readonly IUserHistoryRepository userHistoryRepository;

        public PredictHouseCommandHandler(IUsersManager usersManager, IHouseRepository houseRepository, IUserHistoryRepository userHistoryRepository)
        {
            this.usersManager = usersManager;
            this.houseRepository = houseRepository;
            this.userHistoryRepository = userHistoryRepository;
        }
        public async Task<HouseDTO> Handle(PredictHouseCommand request, CancellationToken cancellationToken)
        {
            House createdHouse = new House
            {
                DateSold = request.HouseForm.DateSold,
                Price = request.HouseForm.Price,
                Bedrooms = request.HouseForm.Bedrooms,
                Bathrooms = request.HouseForm.Bathrooms,
                LivingArea = request.HouseForm.LivingArea,
                LotArea = request.HouseForm.LotArea,
                Floors = request.HouseForm.Floors,
                Waterfront = request.HouseForm.Waterfront,
                View = request.HouseForm.View,
                Condition = request.HouseForm.Condition,
                Grade = request.HouseForm.Grade,
                AboveArea = request.HouseForm.AboveArea,
                BasementArea = request.HouseForm.BasementArea,
                YearBuilt = request.HouseForm.YearBuilt,
                YearRenovated = request.HouseForm.YearRenovated,
                Zipcode = request.HouseForm.Zipcode
            };

            var userId = await usersManager.GetUserIdByName(request.UserName);
            if (userId == null)
            {
                throw new EntityNotFoundException("User does not exist.");
            }

            await houseRepository.AddAsync(createdHouse);
            await userHistoryRepository.AddHouseAsync(userId, createdHouse);

            return request.HouseForm;
        }
    }
}
