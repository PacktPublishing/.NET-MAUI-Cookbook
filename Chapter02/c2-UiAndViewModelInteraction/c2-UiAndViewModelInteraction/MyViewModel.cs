using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using CommunityToolkit.Mvvm.Messaging.Messages;
using System.Collections.ObjectModel;

namespace c2_DecoupleViewAndViewModel {
    public partial class MyViewModel : ObservableObject {
        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(AddCustomerCommand))]
        ObservableCollection<Customer>? customers;

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(InitializeCommand))]
        bool isInitialized;

        [RelayCommand(CanExecute = nameof(CanInitialize))]
        async Task InitializeAsync() {
            Customers = new ObservableCollection<Customer>(await DummyService.GetCustomersAsync());
            IsInitialized = true;
        }
        [RelayCommand(CanExecute = nameof(CanAddCustomer))]
        void AddCustomer() {
            if (Customers != null) {
                Customers.Add(new Customer() { ID = Customers.Count, Name = "New Customer" });
                WeakReferenceMessenger.Default.Send(Customers.Last());
            }
        }
        bool CanAddCustomer() {
            return Customers != null;
        }
        bool CanInitialize() => !IsInitialized;
    }

    public static class DummyService {
        public static async Task<IEnumerable<Customer>> GetCustomersAsync() {
            await Task.Delay(5000);
            List<Customer> customers = new List<Customer>();
            for (int i = 0; i < 40; i++) {
                customers.Add(new Customer() { ID = i, Name = $"Customer{i}" });
            }
            return customers;
        }
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

}
