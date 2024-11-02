using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c3_LottieAnimations {
    public partial class MyViewModel : ObservableObject {
        [ObservableProperty]
        string statusMessage = "Let's run!";

        [RelayCommand]
        async Task HamsterRunAsync() {
            StatusMessage = "Running";
            await Task.Delay(5000);
            StatusMessage = "Complete! Let's run again?";
        }
    }
}
