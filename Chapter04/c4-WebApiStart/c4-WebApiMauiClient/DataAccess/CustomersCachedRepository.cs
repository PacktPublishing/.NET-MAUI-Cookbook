using c4_LocalDatabaseConnection.ViewModels;
using Microsoft.EntityFrameworkCore;
using SharedModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {


    public interface IRepository<TEntity> where TEntity : class {
        Task<TEntity> GetByIdAsync(int id);
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task AddAsync(TEntity item);
        Task UpdateAsync(TEntity item);
        Task DeleteAsync(TEntity item);
    }
    public class CustomersCachedRepository(IRepository<Customer> innerRepository, ICacheService cacheService) : IRepository<Customer> {
        protected readonly IRepository<Customer> InnerRepository = innerRepository;
        protected readonly ICacheService CacheService = cacheService;
        protected readonly string CollectionName = "customers";

        public async Task<IEnumerable<Customer>> GetAllAsync() {
            if (!CacheService.TryGetValue(CollectionName, out object customers)) {
                customers = await InnerRepository.GetAllAsync();
                CacheService.Set(CollectionName, customers);
            }
            return (IEnumerable<Customer>)customers;
        }
        public async Task AddAsync(Customer item) {
            await InnerRepository.AddAsync(item);
            CacheService.AddPendingAction(new CollectionCacheUpdate(CollectionName, cachedList => cachedList.Add(item)));
        }
        public async Task DeleteAsync(Customer item) {
            await InnerRepository.DeleteAsync(item);
            CacheService.AddPendingAction(new CollectionCacheUpdate(CollectionName, cachedList => cachedList.Remove(item)));
        }
        public async Task UpdateAsync(Customer item) {
            await InnerRepository.UpdateAsync(item);
            CacheService.AddPendingAction(new CollectionCacheUpdate(CollectionName, cachedList =>
            {
                int editedItemIndex = ((List<Customer>)cachedList).FindIndex(c => c.Id == item.Id);
                cachedList[editedItemIndex] = item;
            }));
        }
        public async Task<Customer> GetByIdAsync(int id) {
            return await InnerRepository.GetByIdAsync(id);
        }

    }
}
