using Application.Features.Commands;
using Application.Interfaces;
using FakeItEasy;
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

        public async Task Given_DeleteHouseCommandHandlerAndEmptyHouse_When_HandlerIsCalled_Then_ExceptionIsThrown()
        {
            Func<Task<Guid>> act = async () => await handler.Handle(new DeleteHouseCommand {  Id = Guid.Empty }, default);

            await Assert.ThrowsAsync<Exception>(act);
        }
    }
}
