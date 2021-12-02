using Microsoft.EntityFrameworkCore;
using Persistence.EFCore;
using System;

namespace Infrastructure
{
    public class DatabaseSetup : IDisposable
    {
        private readonly DataContext context;

        public DataContext Context => context;
        public DatabaseSetup()
        {
            var options = new DbContextOptionsBuilder<DataContext>().UseInMemoryDatabase("TestDatabase").Options;
            context = new DataContext(options);
            context.Database.EnsureCreated();
        }
        public void Dispose()
        {
            context.Database.EnsureDeleted();
            context.Dispose();
        }
    }
}
