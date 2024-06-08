using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;

namespace c2_DecoupleViewAndViewModel {
    public partial class MyViewModel : ObservableObject {
        [ObservableProperty]
        ObservableCollection<Customer>? customers;

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(InitializeCommand))]
        bool isInitialized;

        IDummyService DataService;
        public MyViewModel(IDummyService dataService) {
            DataService = dataService;
        }
        [RelayCommand(CanExecute = nameof(CanInitialize))]
        async Task InitializeAsync() {
            Customers = new ObservableCollection<Customer>(await DataService.GetCustomersAsync());
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

    public interface IDummyService {
        Task<IEnumerable<Customer>> GetCustomersAsync();
    }
    public class DummyService : IDummyService {
        public async Task<IEnumerable<Customer>> GetCustomersAsync() {
            await Task.Delay(5000);
            return new List<Customer>() {
            new Customer(){ ID = 1, Name = "Jim" },
            new Customer(){ ID = 2, Name = "Bob" }
        };
        }
    }
}
