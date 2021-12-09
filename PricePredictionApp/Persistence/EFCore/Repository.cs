﻿using Application.Interfaces;
using Domain.Common;
using Microsoft.EntityFrameworkCore;

namespace Persistence.EFCore
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : BaseEntity
    {
        protected readonly DataContext context;

        public Repository(DataContext context)
        {
            this.context = context;
        }

        public async Task<TEntity> AddAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(entity)} must not be null.");
            }

            await context.AddAsync(entity);
            await context.SaveChangesAsync();
            return entity;
        }

        public async Task<TEntity> DeleteAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(DeleteAsync)} entity mult not be null");
            }

            context.Remove(entity);
            await context.SaveChangesAsync();
            return entity;
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return await context.Set<TEntity>().ToListAsync();
        }
        public virtual async Task<IEnumerable<TEntity>> GetAllAsync(int pageIndex, int pageSize)
        {
            return await context.Set<TEntity>()
                .Skip(pageIndex * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<TEntity> GetByIdAsync(Guid id)
        {
            if (id == Guid.Empty)
            {
                throw new ArgumentException($"{nameof(GetByIdAsync)} id must not be empty");
            }

            return await context.FindAsync<TEntity>(id);
        }

        public async Task<TEntity> UpdateAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(UpdateAsync)} entity must not be null");
            }

            context.Update(entity);
            await context.SaveChangesAsync();
            return entity;
        }
    }
}
