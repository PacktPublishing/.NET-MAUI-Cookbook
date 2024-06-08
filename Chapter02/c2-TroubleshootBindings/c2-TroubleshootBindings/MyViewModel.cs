using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c2_TroubleshootBindings {
    public partial class MyViewModel : ObservableObject {
        [ObservableProperty]
        ObservableCollection<Customer> customers;
        public MyViewModel() {
            Customers = new ObservableCollection<Customer>();
            for (int i = 1; i < 30; i++) {
                Customers.Add(new Customer() { ID = i, Name = "Name" + i });
            }
        }
        [RelayCommand]
        public void DeleteCustomer(Customer customer) {
            Customers.Remove(customer);
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
