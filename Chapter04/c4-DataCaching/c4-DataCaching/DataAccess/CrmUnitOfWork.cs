using c4_LocalDatabaseConnection.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {
    public class CrmUnitOfWork : IDisposable, IUnitOfWork<Customer> {
        readonly CrmContext Context = new CrmContext();
        readonly ICacheService CacheService = MemoryCacheService.Instance;
        IRepository<Customer> customerRepository;
        public IRepository<Customer> Items =>
            customerRepository ??= new CustomersCachedRepository(new CustomerRepository(Context), CacheService);
        public async Task SaveAsync() {
            await Task.Run(() =>
            {
                try {
                    Context.SaveChanges();
                }
                catch {
                    CacheService.ClearCacheUpdateActions();
                    throw;
                }
                CacheService.ExecuteCacheUpdateActions();
            });
        }

        public void Dispose() {
            Context.Dispose();
        }
    }
    public interface IUnitOfWork<TEntity> where TEntity : class {
        IRepository<TEntity> Items { get; }
        Task SaveAsync();
    }
}
