using System;
using System.Threading.Tasks;
using Xunit;
using FakeItEasy;
using Application.Features.Commands;
using Application.Interfaces;
using Domain.Entities;

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
        public async Task Given_UpdateHouseCommandHandlerAndEmptyHouse_When_HandleIsCalled_Then_ExceptionIsThrown()
        {
         
            Func<Task<Guid>> act = async () => await handler.Handle(new UpdateHouseCommand() { UpdatedHouse = new House()}, default);

            await Assert.ThrowsAsync<Exception>(act);
            //A.CallTo(() => repository.UpdateAsync(A<House>._)).MustHaveHappenedOnceExactly();
        }
    }
}
