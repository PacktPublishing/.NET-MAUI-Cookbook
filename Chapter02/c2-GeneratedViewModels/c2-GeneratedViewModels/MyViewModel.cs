using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace c2_DecoupleViewAndViewModel {
    public partial class MainViewModel : ObservableObject {
        int count;
        [ObservableProperty]
        string textValue = "Click Me!";
        [RelayCommand]
        public void UpdateText() {
            count++;
            if (count == 1)
                TextValue = $"Clicked {count} time";
            else
                TextValue = $"Clicked {count} times";
        }
    }

}
