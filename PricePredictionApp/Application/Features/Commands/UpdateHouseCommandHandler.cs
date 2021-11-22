using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Commands
{
    public class UpdateHouseCommandHandler : IRequestHandler<UpdateHouseCommand, Guid>
    {
        private readonly IHouseRepository repository;

        public UpdateHouseCommandHandler(IHouseRepository repository)
        {
            this.repository = repository;
        }
        public async Task<Guid> Handle(UpdateHouseCommand request, CancellationToken cancellationToken)
        {
            House house = await repository.GetByIdAsync(request.UpdatedHouse.Id);
            if (house == null || house.Id == Guid.Empty)
            {
                throw new Exception("Product does not exist.");
            }

            Array.ForEach(house.GetType().GetProperties(), property => updateProperty(property, house, request.UpdatedHouse));

            await repository.UpdateAsync(house);
            return house.Id;
        }

        private void updateProperty(PropertyInfo currentProperty, House currentHouse, House updatedHouse)
        {
            if (currentProperty.GetValue(updatedHouse) != null)
            {
                currentProperty.SetValue(currentHouse, currentProperty.GetValue(updatedHouse));
            }
        }
    }
}
