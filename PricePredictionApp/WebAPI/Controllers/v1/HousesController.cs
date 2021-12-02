using Application.Exceptions;
using Application.Features.Commands;
using Application.Features.Queries;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Authorization;
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

        [HttpPost]
        [ProducesResponseType(typeof(Guid), StatusCodes.Status201Created)]
        public async Task<IActionResult> Create([FromBody] CreateHouseCommand command)
        {
            return new ObjectResult(await mediator.Send(command)) { StatusCode = StatusCodes.Status201Created };
        }

        [Authorize]
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await mediator.Send(new GetHousesQuery()));
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
