using c4_LocalDatabaseConnection.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection.ViewModels {
    public partial class MainViewModel : ObservableObject {
        [ObservableProperty]
        ObservableCollection<Customer> customers;

        [ObservableProperty]
        bool refreshing;

        [RelayCommand]
        void Showing() {
            Refreshing = true;
        }

        [RelayCommand]
        async Task LoadCustomersAsync() {
            await Task.Run(() =>
            {
                using CrmContext context = new CrmContext();
                Customers = new ObservableCollection<Customer>(context.Customers);
            });
            Refreshing = false;
        }

        [RelayCommand]
        void DeleteCustomer(Customer customer) {
            CrmContext context = new CrmContext();
            context.Customers.Remove(customer);
            context.SaveChanges();
            Customers.Remove(customer);
        }

        [RelayCommand]
        async Task ShowNewFormAsync() {
            await Shell.Current.GoToAsync(nameof(CustomerEditPage),
                parameters: new Dictionary<string, object>
                {
                            { "ParentRefreshAction", (Func<Customer, Task>)RefreshAddedAsync },
                            { "Item", new Customer() },
                });
        }
        Task RefreshAddedAsync(Customer addedCustomer) {
            Customers.Add(addedCustomer);
            return Task.CompletedTask;
        }
    }


}
