using Application.Exceptions;
using Application.Features.Commands;
using Application.Interfaces;
using Domain.Entities;
using FakeItEasy;
using Infrastructure;
using Persistence.EFCore;
using System;
using System.Threading.Tasks;
using Xunit;

namespace Core.CommandHandlers
{
    public class DeleteHouseCommandHandlerTests
    {
        private readonly DeleteHouseCommandHandler handler;
        private readonly IHouseRepository repository;

        public DeleteHouseCommandHandlerTests()
        {
            repository = A.Fake<IHouseRepository>();
            handler = new DeleteHouseCommandHandler(repository);
        }

        [Fact]
        public async Task Given_NonexistentHouseId_When_HandlerIsCalled_Then_EntityNotFoundExceptionIsThrown()
        {
            var command = new DeleteHouseCommand() { Id = Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde") };
            House? fakeHouse = null;
            A.CallTo(() => repository.GetByIdAsync(Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde"))).Returns(fakeHouse);

            Func<DeleteHouseCommand, Task<Guid>> act = async command => await handler.Handle(command, default);

            await Assert.ThrowsAsync<EntityNotFoundException>(() => act(command));
        }

        [Fact]
        public async Task Given_ExistingHouseId_WhenHandlerIsCalled_Then_DeleteAsyncIsCalled()
        {
            var command = new DeleteHouseCommand() { Id = Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cdf") };
            A.CallTo(() => repository.GetByIdAsync(Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cdf"))).Returns(new House());

            await handler.Handle(command, default);

            A.CallTo(() => repository.DeleteAsync(A<House>._)).MustHaveHappenedOnceExactly();

        }
    }
}
