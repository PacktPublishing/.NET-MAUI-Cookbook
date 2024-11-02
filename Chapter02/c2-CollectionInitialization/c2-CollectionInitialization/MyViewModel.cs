using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace c2_DecoupleViewAndViewModel {
    public partial class MyViewModel : ObservableObject {
        [ObservableProperty]
        ObservableCollection<Customer>? customers;

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(InitializeCommand))]
        bool isInitialized;

        [RelayCommand(CanExecute = nameof(CanInitialize))]
        async Task InitializeAsync() {
            Customers = new ObservableCollection<Customer>(await DummyService.GetCustomersAsync());
            IsInitialized = true;
        }
        bool CanInitialize() => !IsInitialized;

    }
    public class Customer {
        public int ID {
            get;
            set;
        }
        public string? Name {
            get;
            set;
        }
    }

    public static class DummyService {
        public static async Task<IEnumerable<Customer>> GetCustomersAsync() {
            await Task.Delay(5000);
            return new List<Customer>() {
            new Customer(){ ID = 1, Name = "Jim" },
            new Customer(){ ID = 2, Name = "Bob" }
        };
        }
    }
}
