using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.v1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("[controller]")]
    public class HousesController : BaseController
    {
        public HousesController(IMediator mediator) : base(mediator)
        {
        }
    }
}
