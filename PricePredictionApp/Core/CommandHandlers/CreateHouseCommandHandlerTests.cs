using Application.DTO;
using Application.Features.Commands;
using Application.Interfaces;
using Domain.Entities;
using FakeItEasy;
using System;
using System.Threading.Tasks;
using Xunit;

namespace Core.CommandHandlers
{
    public class CreateHouseCommandHandlerTests
    {
        private readonly CreateHouseCommandHandler handler;
        private readonly IHouseRepository repository;

        public CreateHouseCommandHandlerTests()
        {
            repository = A.Fake<IHouseRepository>();
            handler = new CreateHouseCommandHandler(repository);  
        }

        [Fact]
        public async Task Given_NullNewHouse_When_HandlerIsCalled_Then_ArgumentNullExceptionIsThrown()
        {
            var command = new CreateHouseCommand();

            Func<CreateHouseCommand, Task<Guid>> act = async command => await handler.Handle(command, default);

            await Assert.ThrowsAsync<ArgumentNullException>(() => act(command));
        }

        [Fact]
        public async Task Given_CreateHouseCommandHandler_When_HandlerIsCalled_Then_AddAsyncIsCalled()
        {
            var command = new CreateHouseCommand()
            {
                NewHouse = new HouseDTO()
            };

            await handler.Handle(command, default);

            A.CallTo(() => repository.AddAsync(A<House>._)).MustHaveHappenedOnceExactly();
        }
    }
}
