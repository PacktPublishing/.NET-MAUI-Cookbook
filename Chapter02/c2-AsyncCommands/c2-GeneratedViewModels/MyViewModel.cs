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
        [RelayCommand(IncludeCancelCommand = true)]
        public async Task UpdateTextAsync(CancellationToken token) {
            try {
                await Task.Delay(5000, token);
            }
            catch (OperationCanceledException) {
                return;
            }
            //other logic
        }
    }
}
