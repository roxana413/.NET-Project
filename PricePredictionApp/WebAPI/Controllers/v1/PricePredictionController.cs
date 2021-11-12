using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.v1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("[controller]")]
    public class PricePredictionController : BaseController
    {
        public PricePredictionController(IMediator mediator) : base(mediator)
        {
        }
    }
}
