using Domain.Common;

namespace Application.Interfaces
{
    public interface IRepository<TEntity> where TEntity : BaseEntity
    {
        Task<TEntity> AddAsync(TEntity entity);
        Task<TEntity> UpdateAsync(TEntity entity);
        Task<TEntity> DeleteAsync(TEntity entity);
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task<IEnumerable<TEntity>> GetAllAsync(int pageIndex, int pageSize);
        Task<TEntity> GetByIdAsync(Guid id);
    }
}
