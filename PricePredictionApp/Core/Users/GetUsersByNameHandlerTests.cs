using Application.DTO;
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
    public class GetUsersByNameHandlerTests
    {
        private readonly GetUserByNameHandler handler;
        private readonly IUsersManager usersManager;

        public GetUsersByNameHandlerTests()
        {
            usersManager = A.Fake<IUsersManager>();
            handler = new GetUserByNameHandler(usersManager);
        }

        [Fact]
        public async Task Given_NullUserName_When_HandlerIsCalled_Then_ArgumentNullExceptionIsThrown()
        {
            var query = new GetUserByName();

            Func<GetUserByName, Task<UserDTO>> act = async (query) => await handler.Handle(query, default);

            await Assert.ThrowsAsync<ArgumentNullException>(() => act(query));
        }

        [Fact]
        public async Task Given_InitializedUsername_When_HandlerIsCalled_Then_GetUserByNameIsCalled()
        {
            var query = new GetUserByName() { UserName = "test" };

            await handler.Handle(query, default);

            A.CallTo(() => usersManager.GetUserByName(query.UserName)).MustHaveHappenedOnceExactly();
        }
    }
}
