using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection.ViewModels {
    public partial class CustomerEditViewModel : ObservableObject, IQueryAttributable {
        [ObservableProperty]
        Customer item;

        protected Func<Customer, Task> ParentRefreshAction { get; set; }

        [RelayCommand]
        async Task SaveAsync() {
            using CrmContext context = new CrmContext();
            context.Customers.Add(Item);
            context.SaveChanges();
            await ParentRefreshAction(Item);
            await Shell.Current.GoToAsync("..");
        }

        public void ApplyQueryAttributes(IDictionary<string, object> query) {
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
