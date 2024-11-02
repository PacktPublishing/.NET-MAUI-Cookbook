using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection.ViewModels {
    public partial class CustomerEditViewModel : CustomerDetailViewModel {
        [ObservableProperty]
        bool isNewItem;

        //[ObservableProperty]
        //Customer item;

        //public Func<Customer, Task> ParentSaveAction { get; set; }

        [RelayCommand]
        async Task SaveAsync() {
            CrmContext context = new CrmContext();
            if (IsNewItem) {
                context.Customers.Add(Item);
            }
            else {
                context.Customers.Attach(Item);
                context.Entry(Item).State = EntityState.Modified;
            }
            context.SaveChanges();
            await ParentRefreshAction(Item);
            await Shell.Current.GoToAsync("..");
        }

        public override void ApplyQueryAttributes(IDictionary<string, object> query) {
            if (query.TryGetValue("IsNewItem", out object isNew)) {
                IsNewItem = (bool)isNew;
            }
            base.ApplyQueryAttributes(query);
        }
    }
}
