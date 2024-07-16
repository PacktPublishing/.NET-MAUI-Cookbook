using c4_LocalDatabaseConnection.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {
    //public class CrmUnitOfWork : IDisposable {
    //    readonly CrmContext Context = new CrmContext();
    //    CustomersCachedReporitory customerRepository;
    //    readonly ICacheService CacheService = MemoryCacheService.Instance;
    //    public CustomersCachedReporitory CustomerRepository =>
    //        customerRepository ??= new CustomersCachedReporitory(new CustomerRepository(Context), CacheService);
    //    public async Task SaveAsync() {
    //        await Task.Run(() =>
    //        {
    //            try {
    //                Context.SaveChanges();
    //            }
    //            catch {
    //                CustomerRepository.ClearCacheUpdateActins();
    //                throw;
    //            }
    //            CustomerRepository.ExecuteCacheUpdateActins();
    //        });
    //    }
    //    public void Dispose() {
    //        Context.Dispose();
    //    }
    //}
}
