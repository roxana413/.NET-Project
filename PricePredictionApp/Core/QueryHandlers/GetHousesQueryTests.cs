using Application.Features.Queries;
using Application.Interfaces;
using FakeItEasy;
using System.Threading.Tasks;
using Xunit;

namespace Core.QueryHandlers
{
    public class GetHousesQueryTests
    {
        private readonly GetHousesQueryHandler handler;
        private readonly IHouseRepository repository;

        public GetHousesQueryTests()
        {
            repository = A.Fake<IHouseRepository>();
            handler = new GetHousesQueryHandler(repository);
        }

        [Fact]
        public async Task Given_GetHousesHandler_When_HandlerIsCalled_Then_GetAllAsyncIsCalled()
        {
            var query = new GetHousesQuery();

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetAllAsync()).MustHaveHappenedOnceExactly();
        }
    }
}
