using Application.DTO;
using Application.Exceptions;
using Application.Features.UserHistory.Queries;
using Application.Interfaces;
using FakeItEasy;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace Core.UserHistory
{
    public class GetUserHistoryQueryHandlerTests
    {
        private readonly IUsersManager usersManager;
        private readonly IUserHistoryRepository userHistoryRepository;
        private readonly GetUserHistoryQueryHandler handler;

        public GetUserHistoryQueryHandlerTests()
        {
            usersManager = A.Fake<IUsersManager>();
            userHistoryRepository = A.Fake<IUserHistoryRepository>();
            handler = new GetUserHistoryQueryHandler(usersManager, userHistoryRepository);
        }

        [Fact]
        public async Task Given_NullUsername_When_HandlerIsCalled_Then_ArgumentNullExceptionIsThrown()
        {
            var query = new GetUserHistoryQuery();

            Func<GetUserHistoryQuery, Task<IEnumerable<HouseDTO>>> act = async (query) => await handler.Handle(query, default);

            await Assert.ThrowsAsync<ArgumentNullException>(() => act(query));
        }

        [Fact]
        public async Task Given_NonexistentUser_When_HandlerIsCalled_Then_EntityNotFoundExceptionIsThrown()
        {
            var query = new GetUserHistoryQuery()
            {
                UserName = "test"
            };
            A.CallTo(() => usersManager.GetUserIdByName(query.UserName)).Returns((string?)null);

            Func<GetUserHistoryQuery, Task<IEnumerable<HouseDTO>>> act = async (query) => await handler.Handle(query, default);

            await Assert.ThrowsAsync<EntityNotFoundException>(() => act(query));
        }

        [Fact]
        public async Task Given_ExistingUser_When_HandlerIsCalled_Then_GetAllHousesAsyncIsCalled()
        {
            var query = new GetUserHistoryQuery()
            {
                UserName = "test"
            };
            A.CallTo(() => usersManager.GetUserIdByName(query.UserName)).Returns("21e34a4f-f2fc-4343-ac55-3f7f35f19cdf");

            await handler.Handle(query, default);

            A.CallTo(() => userHistoryRepository.GetAllHousesAsync("21e34a4f-f2fc-4343-ac55-3f7f35f19cdf")).MustHaveHappenedOnceExactly();
        }
    }
}
