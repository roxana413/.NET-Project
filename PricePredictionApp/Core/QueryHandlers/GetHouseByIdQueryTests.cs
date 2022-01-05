using Application.Exceptions;
using Application.Features.Queries;
using Application.Interfaces;
using Domain.Entities;
using FakeItEasy;
using System;
using System.Threading.Tasks;
using Xunit;

namespace Core.QueryHandlers
{
    public class GetHouseByIdQueryTests
    {
        private readonly GetHouseByIdQueryHandler handler;
        private readonly IHouseRepository repository;

        public GetHouseByIdQueryTests()
        {
            repository = A.Fake<IHouseRepository>();
            handler = new GetHouseByIdQueryHandler(repository);
        }

        [Fact]
        public async Task Given_NonexistentHouse_When_HandlerIsCalled_Then_EntityNotFoundExceptionThrown()
        {
            var query = new GetHouseByIdQuery() { Id = Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde") };
            A.CallTo(() => repository.GetByIdAsync(Guid.Parse("21e34a4f-f2fc-4343-ac55-3f7f35f19cde"))).Returns((House)null);

            Func<GetHouseByIdQuery, Task<House>> act = async (query) => await handler.Handle(query, default);

            await Assert.ThrowsAsync<EntityNotFoundException>(() => act(query));
        }

        [Fact]
        public async Task Given_GetHouseByIdQueryHandler_When_HandleIsCalled_Then_GetHouseByIdAsyncIsCalled()
        {
            var query = new GetHouseByIdQuery();

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetByIdAsync(query.Id)).MustHaveHappenedOnceExactly();
        }
    }
}
