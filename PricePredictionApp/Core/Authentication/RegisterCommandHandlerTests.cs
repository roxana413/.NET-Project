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
    public class RegisterCommandHandlerTests
    {
        private readonly RegisterCommandHandler handler;
        private readonly IAuthenticationManager authenticationManager;
        public RegisterCommandHandlerTests()
        {
            authenticationManager = A.Fake<IAuthenticationManager>();
            handler = new RegisterCommandHandler(authenticationManager);
        }

        [Fact]
        public async Task Given_NullRegisterInfo_When_HandlerIsCalled_Then_ArgumentNullExceptionIsThrown()
        {
            var command = new RegisterCommand();

            Func<RegisterCommand, Task<(AuthenticationStatus Status, string? ErrorMessage)>> act = async command => await handler.Handle(command, default);

            await Assert.ThrowsAsync<ArgumentNullException>(() => act(command));

        }

        [Fact]
        public async Task Given_LoginCommandHandler_When_HandlerIsCalled_Then_LoginIsCalled()
        {
            var command = new RegisterCommand()
            {
                RegisterInfo = new RegisterModel()
                {
                    Password = "test",
                    UserName = "test",
                    Email = "test"
                }
            };

            await handler.Handle(command, default);

            A.CallTo(() => authenticationManager.Register(command.RegisterInfo)).MustHaveHappenedOnceExactly();
        }
    }
}
