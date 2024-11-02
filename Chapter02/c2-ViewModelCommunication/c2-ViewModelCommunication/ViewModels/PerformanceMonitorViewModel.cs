using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Messaging;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c2_ViewModelCommunication.ViewModels {
    public partial class PerformanceMonitorViewModel : ObservableObject {
        [ObservableProperty]
        ObservableCollection<string> performanceAlerts;
        public PerformanceMonitorViewModel() {
            performanceAlerts = new ObservableCollection<string>();
            WeakReferenceMessenger.Default.Register<AlertMessage, string>(this, AlertTypes.Performance, (r, alert) =>
            {
                PerformanceAlerts.Add(alert.Value);
            });
        }
    }
}
