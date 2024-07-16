using System;

namespace c4_LocalDatabaseConnection {
    public interface IRepository<TEntity> where TEntity : class {
        Task<TEntity> GetByIdAsync(int id);
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task AddAsync(TEntity item);
        Task UpdateAsync(TEntity item);
        Task DeleteAsync(TEntity item);
    }
}
