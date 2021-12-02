using Application.Features.Queries;
using Application.Interfaces;
using FakeItEasy;
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
        public async Task Given_GetHouseByIdQueryHandler_When_HandleIsCalled_Then_GetHouseByIdAsyncIsCalled()
        {
            var query = new GetHouseByIdQuery();

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetByIdAsync(query.Id)).MustHaveHappenedOnceExactly();
        }
    }
}
