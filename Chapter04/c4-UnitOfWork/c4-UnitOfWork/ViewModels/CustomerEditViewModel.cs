using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Data.Sqlite;
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

        [RelayCommand]
        async Task SaveAsync() {
            using var uof = new CrmUnitOfWork();
            if (IsNewItem == true)
                await uof.Items.AddAsync(Item);
            else
                await uof.Items.UpdateAsync(Item);
            await uof.SaveAsync();
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
