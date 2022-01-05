using System;
using System.Threading.Tasks;
using Xunit;
using FakeItEasy;
using Application.Features.Commands;
using Application.Interfaces;
using Domain.Entities;
using Application.Exceptions;

namespace Core.CommandHandlers
{
    public class UpdateHouseCommandHandlerTests
    {
        private readonly UpdateHouseCommandHandler handler;
        private readonly IHouseRepository repository;

        public UpdateHouseCommandHandlerTests()
        {
            repository = A.Fake<IHouseRepository>();
            handler = new UpdateHouseCommandHandler(repository);
        }

        [Fact]
        public async Task Given_NullUpdatedHouse_When_HandlerIsCalled_Then_ArgumentNullExceptionIsThrown()
        {
            var command = new UpdateHouseCommand();

            Func<UpdateHouseCommand, Task<Guid>> act = async command => await handler.Handle(command, default);

            await Assert.ThrowsAsync<ArgumentNullException>(() => act(command));
        }

        [Fact]
        public async Task Given_NonexistentHouse_When_HandlerIsCalled_Then_EntityNotFoundExceptionIsThrown()
        {
            var command = new UpdateHouseCommand()
            {
                UpdatedHouse = new House() { Id = Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde") }
            };
            A.CallTo(() => repository.GetByIdAsync(Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde"))).Returns((House) null);
            
            Func<Task<Guid>> act = async () => await handler.Handle(command, default);

            await Assert.ThrowsAsync<EntityNotFoundException>(act);
        }

        [Fact]
        public async Task Given_ExistingHouseWithEmptyGuid_When_HandlerIsCalled_Then_EntityNotFoundExceptionIsThrown()
        {
            var command = new UpdateHouseCommand()
            {
                UpdatedHouse = new House() { Id = Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde") }
            };
            A.CallTo(() => repository.GetByIdAsync(Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde"))).Returns(new House() { Id = Guid.Empty });

            Func<Task<Guid>> act = async () => await handler.Handle(command, default);

            await Assert.ThrowsAsync<EntityNotFoundException>(act);
        }

        [Fact]
        public async Task Given_ExistingHouse_When_HandlerIsCalled_Then_EntityNotFoundExceptionIsThrown()
        {
            var command = new UpdateHouseCommand()
            {
                UpdatedHouse = new House() { 
                    Id = Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde")
                }
            };
            A.CallTo(() => repository.GetByIdAsync(Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde"))).Returns(new House()
            {
                Id = Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde")
            });

            await handler.Handle(command, default);

            A.CallTo(() => repository.UpdateAsync(A<House>._)).MustHaveHappenedOnceExactly();
        }
    }
}
