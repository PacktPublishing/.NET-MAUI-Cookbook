using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection.ViewModels {
    public partial class CustomerEditFormViewModel : ObservableObject {
        [ObservableProperty]
        public Customer editedItem;

        [ObservableProperty]
        public bool isNewItem;
    }
}
