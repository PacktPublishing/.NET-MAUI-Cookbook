using c4_LocalDatabaseConnection.DataAccess;

namespace c4_LocalDatabaseConnection {
    public class CrmUnitOfWork : IDisposable, IUnitOfWork<Customer> {
        readonly ICacheService CacheService = MemoryCacheService.Instance;
        IRepository<Customer> customerRepository;
        public IRepository<Customer> Items =>
            customerRepository ??= new CustomersCachedRepository(new CustomerWebRepository(), CacheService);

        public async Task SaveAsync() {
            CacheService.ExecuteCacheUpdateActions();
            await Task.CompletedTask;
        }

        public void Dispose() { }
    }
    public interface IUnitOfWork<TEntity> where TEntity : class {
        IRepository<TEntity> Items { get; }
        Task SaveAsync();
    }
}
