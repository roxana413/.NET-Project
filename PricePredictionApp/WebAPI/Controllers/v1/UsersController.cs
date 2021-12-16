using Application.Features.Users.Queries;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace WebAPI.Controllers.v1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("[controller]")]
    public class UsersController : BaseController
    {
       
        public UsersController(IMediator mediator) : base(mediator)
        {
        }
        [Authorize(Roles = "Admin")]
        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            return Ok(await mediator.Send(new GetUsersQuery()));
        }

        [Authorize]
        [HttpGet("me")]
        public async Task<IActionResult> GetCurrentUser()
        {
            return Ok(await mediator.Send(new GetUserByName()
            {
                UserName = HttpContext.User.Identity.Name
            }));
        }
    }
}
