using Application.DTO.Authentication;
using Application.Enumerations;
using Application.Features.Authentication;
using Application.Interfaces;
using FakeItEasy;
using System;
using System.Threading.Tasks;
using Xunit;

namespace Core.Authentication
{
    public class LoginCommandHandlerTests
    {
        private readonly LoginCommandHandler handler;
        private readonly IAuthenticationManager authenticationManager;
        public LoginCommandHandlerTests()
        {
            authenticationManager = A.Fake<IAuthenticationManager>();
            handler = new LoginCommandHandler(authenticationManager);
        }

        [Fact]
        public async Task Given_NullLoginInfo_When_HandlerIsCalled_Then_ArgumentNullExceptionIsThrown()
        {
            var command = new LoginCommand();

            Func<LoginCommand, Task<(AuthenticationStatus Status, LoginToken? Token, string? ErrorMessage)>> act = async command => await handler.Handle(command, default);

            await Assert.ThrowsAsync<ArgumentNullException>(() => act(command));

        }

        [Fact]
        public async Task Given_InitializedLoginInfo_When_HandlerIsCalled_Then_LoginIsCalled()
        {
            var command = new LoginCommand()
            {
                LoginInfo = new LoginModel()
                {
                    Password = "test",
                    UserName = "test"
                }
            };

            await handler.Handle(command, default);

            A.CallTo(() => authenticationManager.Login(command.LoginInfo)).MustHaveHappenedOnceExactly();
        }
    }
}
