using c4_LocalDatabaseConnection.DataAccess;
using c4_LocalDatabaseConnection.ViewModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {
    public class CustomerRepository : IRepository<Customer> {
        readonly DbSet<Customer> DbSet;
        readonly CrmContext Context;

        public CustomerRepository(CrmContext context) {
            Context = context;
            DbSet = context.Set<Customer>();
        }
        public async Task<IEnumerable<Customer>> GetAllAsync() {
            return await Task.Run(() => DbSet.ToList());
        }
        public async Task AddAsync(Customer item) {
            DbSet.Add(item);
            await Task.CompletedTask;
        }
        public async Task DeleteAsync(Customer item) {
            DbSet.Remove(item);
            await Task.CompletedTask;
        }
        public async Task<Customer> GetByIdAsync(int id) {
            return await Task.Run(() => DbSet.Find(id));
        }
        public async Task UpdateAsync(Customer item) {
            DbSet.Attach(item);
            Context.Entry(item).State = EntityState.Modified;
            await Task.CompletedTask;
        }
    }
}
