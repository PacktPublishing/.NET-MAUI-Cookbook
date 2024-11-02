using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace c2_DecoupleViewAndViewModel {
    public class MainViewModel : INotifyPropertyChanged {
        int count = 0;
        string textValue = "Click Me!";
        public string TextValue {
            get {
                return textValue;
            }
            set {
                textValue = value;
                OnPropertyChanged();
            }
        }
        public ICommand UpdateTextCommand {
            get;
            set;
        }
        public MainViewModel() {
            UpdateTextCommand = new Command(UpdateText);
        }
        public void UpdateText() {
            count++;
            if (count == 1)
                TextValue = $"Clicked {count} time";
            else
                TextValue = $"Clicked {count} times";
        }
        protected void OnPropertyChanged([CallerMemberName] string? propertyName = null) {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        public event PropertyChangedEventHandler? PropertyChanged;
    }

}
