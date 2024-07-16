using c4_LocalDatabaseConnection.ViewModels;
using Microsoft.EntityFrameworkCore;
using SharedModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {
    public class CustomerWebRepository : IRepository<Customer> {
        readonly HttpClient httpClient = WebApiHttpClient.Instance;
        readonly string CollectionName = "Customers";
        public async Task<IEnumerable<Customer>> GetAllAsync() {
            var response = await httpClient.GetAsync(CollectionName);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<IEnumerable<Customer>>();
        }
        public async Task AddAsync(Customer item) {
            var response = await httpClient.PostAsJsonAsync(CollectionName, item);
            response.EnsureSuccessStatusCode();
        }
        public async Task DeleteAsync(Customer item) {
            var response = await httpClient.DeleteAsync($"{CollectionName}/{item.Id}");
            response.EnsureSuccessStatusCode();
        }
        public async Task<Customer> GetByIdAsync(int id) {
            var response = await httpClient.GetAsync($"{CollectionName}/{id}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<Customer>();
        }
        public async Task UpdateAsync(Customer item) {
            var response = await httpClient.PutAsJsonAsync($"{CollectionName}/{item.Id}", item);
            response.EnsureSuccessStatusCode();
        }
    }
}
