using Application.DTO.Authentication;
using Application.Enumerations;
using Application.Features.Authentication;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.v1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("[controller]")]
    public class AuthenticationController : BaseController
    {
        public AuthenticationController(IMediator mediator) : base(mediator)
        {
        }

        [HttpPost("Register")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(string), StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Register([FromBody] RegisterCommand command)
        {
            var result = await mediator.Send(command);
            if (result.Status == AuthenticationStatus.SUCCESS)
            {
                return Ok();
            }
            return BadRequest(result.ErrorMessage);
        }

        [HttpPost("Login")]
        [ProducesResponseType(typeof(LoginToken), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(string), StatusCodes.Status401Unauthorized)]
        public async Task<IActionResult> Login([FromBody] LoginCommand command)
        {
            var result = await mediator.Send(command);
            if (result.Status == AuthenticationStatus.SUCCESS)
            {
                return Ok(result.Token);
            }
            return Unauthorized(result.ErrorMessage);
        }
    }
}
