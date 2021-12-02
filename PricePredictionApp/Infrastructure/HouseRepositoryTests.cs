using Domain.Entities;
using FluentAssertions;
using Persistence.EFCore;
using System;
using Xunit;

namespace Infrastructure
{
    public class HouseRepositoryTests
    {
        private readonly DataContext context;
        private readonly HouseRepository repository;
        private House[] houses;
        public HouseRepositoryTests()
        {
            DatabaseSetup setup = new DatabaseSetup();
            context = setup.Context;
            initializeContext(out this.houses);
            repository = new HouseRepository(context);
        }

        [Fact]
        public async void Given_NewHouse_WhenProductIsNotNull_Then_AddAsyncShouldReturnNewHouse()
        {
            House newHouse = new House()
            {
                Zipcode = "1234"
            };
            
            var result = await repository.AddAsync(newHouse);

            result.Should().BeOfType<House>();
        }

        
        

        [Fact]
        public async void Given_HouseID_When_HouseInDB_Then_GetByIdAsyncShouldReturnHouse()
        {
            var result = await repository.GetByIdAsync(houses[0].Id);

            result.Should().BeOfType<House>();
        }

        

        private void initializeContext(out House[] houses)
        {
            houses = new[]
            {
                new House()
                {
                    Id = Guid.Parse("0d6db7e4-dbe9-4877-83b1-3bfb65bacc85"),
                    Zipcode = "1234"
                },
                new House()
                {
                    Id = Guid.Parse("009e76fc-9f0f-4bbd-8fc5-cb27bdd648a5"),
                    Zipcode = "12345"
                },
                new House()
                {
                    Id = Guid.Parse("203c0953-2f00-4b2b-bfb7-cff9881b9294"),
                    Zipcode = "12345"
                },
                new House()
                {
                    Id = Guid.Parse("1114d395-08c1-4f06-9ee7-a15928476e1b"),
                    Zipcode = "12345"
                },
                new House()
                {
                    Id = Guid.Parse("c492897c-263e-4e2f-9d36-9d204f481236"),
                    Zipcode = "12345"
                }
            };
            context.Houses.AddRange(houses);
        }
    }
}
