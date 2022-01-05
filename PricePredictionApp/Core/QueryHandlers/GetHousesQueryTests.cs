using Application.Constants;
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
        public async Task Given_NullPageIndexAndPageSize_When_HandlerIsCalled_Then_GetAllAsyncIsCalled()
        {
            var query = new GetHousesQuery();

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetAllAsync(A<int>.That.Matches(x => x == PaginationConstants.PageIndex), A<int>.That.Matches(x => x == PaginationConstants.PageSize))).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task Given_NullPageSize_When_HandlerIsCalled_Then_PageSizeIsDefault()
        {
            var query = new GetHousesQuery() { PageIndex = 1 };

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetAllAsync(A<int>.That.Matches(x => x == query.PageIndex), A<int>.That.Matches(x => x == PaginationConstants.PageSize))).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task Given_NullPageIndex_When_HandlerIsCalled_Then_PageIndexIsDefault()
        {
            var query = new GetHousesQuery() { PageSize = 1 };

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetAllAsync(A<int>.That.Matches(x => x == PaginationConstants.PageIndex), A<int>.That.Matches(x => x == query.PageSize))).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task Given_InitializedPageSizeAndPageIndex_When_HandlerIsCalled_Then_PageSizeAndIndexAreUsed()
        {
            var query = new GetHousesQuery() { PageIndex = 0, PageSize = 1 };

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetAllAsync(A<int>.That.Matches(x => x == query.PageIndex), A<int>.That.Matches(x => x == query.PageSize))).MustHaveHappenedOnceExactly();
        }
    }
}
