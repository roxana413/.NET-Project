using Application.Interfaces;
using Domain.Entities;
using MediatR;

namespace Application.Features.Commands
{
    public class DeleteHouseCommandHandler : IRequestHandler<DeleteHouseCommand, Guid>
    {
        private readonly IHouseRepository repository;

        public DeleteHouseCommandHandler(IHouseRepository repository)
        {
            this.repository = repository;
        }
        public async Task<Guid> Handle(DeleteHouseCommand request, CancellationToken cancellationToken)
        {
            House house = await repository.GetByIdAsync(request.Id);
            if (house == null)
            {
                throw new Exception("Product does not exist.");
            }

            await repository.DeleteAsync(house);
            return house.Id;
        }
    }
}
