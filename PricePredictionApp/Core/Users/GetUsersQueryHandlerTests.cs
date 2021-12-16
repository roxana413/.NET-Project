using Application.Features.Users.Queries;
using Application.Interfaces;
using FakeItEasy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Core.Users
{
    public class GetUsersQueryHandlerTests
    {
        private readonly GetUsersQueryHandler handler;
        private readonly IUsersManager usersManager;

        public GetUsersQueryHandlerTests()
        {
            usersManager = A.Fake<IUsersManager>();
            handler = new GetUsersQueryHandler(usersManager);
        }

        [Fact]
        public async Task Given_GetUsersQuery_When_HandlerIsCalled_Then_GetUsersIsCalled()
        {
            var query = new GetUsersQuery();

            await handler.Handle(query, default);

            A.CallTo(() => usersManager.GetUsers()).MustHaveHappenedOnceExactly();
        }
    }
}
