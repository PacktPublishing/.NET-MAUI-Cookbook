using c4_LocalDatabaseConnection.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection.ViewModels {
    public partial class CustomerDetailViewModel : ObservableObject, IQueryAttributable {
        [ObservableProperty]
        Customer item;

        public Func<Customer, Task> ParentRefreshAction { get; set; }

        [RelayCommand]
        async Task ShowEditFormAsync() {
            using var uof = new CrmUnitOfWork();
            Customer editedItem = await uof.Items.GetByIdAsync(Item.Id);
            await Shell.Current.GoToAsync(nameof(CustomerEditPage),
              parameters: new Dictionary<string, object>
                          {
                        { "ParentRefreshAction", (Func<Customer, Task>)ItemEditedAsync },
                        { "Item", editedItem }
                          });
        }

        async Task ItemEditedAsync(Customer customer) {
            Item = customer;
            await ParentRefreshAction(customer);
        }
        public virtual void ApplyQueryAttributes(IDictionary<string, object> query) {
            if (query.TryGetValue("Item", out object currentItem)) {
                Item = (Customer)currentItem;
            }
            if (query.TryGetValue("ParentRefreshAction", out object parentRefreshAction)) {
                ParentRefreshAction = (Func<Customer, Task>)parentRefreshAction;
            }
            query.Clear();
        }
    }
}
