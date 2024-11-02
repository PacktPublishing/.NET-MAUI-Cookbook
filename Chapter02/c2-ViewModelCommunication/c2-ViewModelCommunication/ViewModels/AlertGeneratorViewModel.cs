using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using CommunityToolkit.Mvvm.Messaging.Messages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c2_ViewModelCommunication.ViewModels {
    public partial class AlertGeneratorViewModel : ObservableObject {
        [ObservableProperty]
        string? alertText;
        int alertCount = 0;
        [RelayCommand]
        public void GenerateAlert() {
            string channelType = ++alertCount % 2 == 0 ?
                AlertTypes.Security : AlertTypes.Performance;
            WeakReferenceMessenger.Default.Send(new AlertMessage(AlertText), channelType);
        }
    }
    public class AlertMessage(string? value) : ValueChangedMessage<string?>(value) { }
    public static class AlertTypes {
        public static string Security = "SecurityAlert";
        public static string Performance = "Performance";
    }
}
