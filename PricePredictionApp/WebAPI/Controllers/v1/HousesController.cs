using Application.Exceptions;
using Application.Features.Commands;
using Application.Features.Queries;
using Application.Features.UserHistory.Queries;
using Application.Features.PricePrediction;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Application.DTO;

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

        [HttpPost]
        [ProducesResponseType(typeof(Guid), StatusCodes.Status201Created)]
        public async Task<IActionResult> Create([FromBody] CreateHouseCommand command)
        {
            return new ObjectResult(await mediator.Send(command)) { StatusCode = StatusCodes.Status201Created };
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<HouseDTO>), StatusCodes.Status200OK)]
        public async Task<IActionResult> Get([FromQuery] int pageIndex, [FromQuery] int pageSize)
        {
            return Ok(await mediator.Send(new GetHousesQuery() { PageIndex = pageIndex, PageSize = pageSize }));
        }

        [HttpGet("{Id}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(House), StatusCodes.Status200OK)]
        public async Task<IActionResult> GetById([FromRoute] Guid Id)
        {
            try
            {
                return Ok(await mediator.Send(new GetHouseByIdQuery { Id = Id}));
            }
            catch (EntityNotFoundException ex)
            {
                return NotFound(ex.Message); 
            }
        }

        [Authorize]
        [HttpGet("history")]
        [ProducesResponseType(typeof(string), StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(typeof(IEnumerable<HouseDTO>), StatusCodes.Status200OK)]
        public async Task<IActionResult> GetHistory()
        {
            try
            {
                return Ok(await mediator.Send(new GetUserHistoryQuery()
                {
                    UserName = HttpContext.User.Identity.Name
                }));
            }
            catch (EntityNotFoundException ex)
            {
                return new ObjectResult(ex.Message) { StatusCode = StatusCodes.Status500InternalServerError };
            }
            
        }

        [Authorize]
        [HttpPost("predict")]
        [ProducesResponseType(typeof(string), StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(typeof(HouseDTO), StatusCodes.Status200OK)]
        public async Task<IActionResult> Predict([FromBody] HouseDTO houseForm)
        {
            try
            {
                return Ok(await mediator.Send(new PredictHouseCommand()
                {
                    UserName = HttpContext.User.Identity.Name,
                    HouseForm = houseForm
                }));
            }
            catch (EntityNotFoundException ex)
            {
                return new ObjectResult(ex.Message) { StatusCode = StatusCodes.Status500InternalServerError };
            }
            
        }

        [HttpPut]
        [ProducesResponseType(typeof(Guid), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Update([FromBody] UpdateHouseCommand command)
        {
            try
            {
                return Ok(await mediator.Send(command));
            }
            catch (EntityNotFoundException ex)
            {
                return NotFound(ex.Message);
            }
        }

        [HttpDelete("{Id}")]
        [ProducesResponseType(typeof(Guid), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete([FromRoute] Guid Id)
        {
            try
            {
                return Ok(await mediator.Send(new DeleteHouseCommand { Id = Id }));
            }
            catch (EntityNotFoundException ex)
            {
                return NotFound(ex.Message);
            }
        }


    }
}
