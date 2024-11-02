using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

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
    }
}
