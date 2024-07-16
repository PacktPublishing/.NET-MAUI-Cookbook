using c4_LocalDatabaseConnection.DataAccess;
using c4_LocalDatabaseConnection.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {
    public class CrmUnitOfWork : IDisposable, IUnitOfWork<Customer> {
        readonly CrmContext Context = new CrmContext();
        IRepository<Customer> customerRepository;
        public IRepository<Customer> Items =>
            customerRepository ??= new CustomerRepository(Context);
        public async Task SaveAsync() {
            await Task.Run(() => Context.SaveChanges());
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
