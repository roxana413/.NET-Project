using Application.Features.Commands;
using Application.Features.Queries;
using Application.Interfaces;
using Domain.Entities;
using FakeItEasy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Core.QueryHandlers
{
    public class GetHouseByIdQueryTests
    {
        private readonly GetHouseByIdQueryHandler handler;
        private readonly IHouseRepository repository;

        public GetHouseByIdQueryTests()
        {
            repository = A.Fake<IHouseRepository>();
            handler = new GetHouseByIdQueryHandler(repository);
        }

        [Fact]
        public async Task Given_GetHouseByIdQueryHandler_When_HandleIsCalled_Then_GetHouseByIdAsyncIsCalled()
        {
            var query = new GetHouseByIdQuery();

            await handler.Handle(query, default);

            A.CallTo(() => repository.GetByIdAsync(query.Id)).MustHaveHappenedOnceExactly();
        }
    }
}
