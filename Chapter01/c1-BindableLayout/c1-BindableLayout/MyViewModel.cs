using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c1_BindableLayout {
    public class MyViewModel {
        public ObservableCollection<ActionInfo> DynamicActions { get; set; }
        public MyViewModel() {
            DynamicActions = new ObservableCollection<ActionInfo> {
            new ActionInfo() { Caption = "Action1" },
            new ActionInfo() { Caption = "Action2" },
            new ActionInfo() { Caption = "Action3" }
        };
        }
    }
    public class ActionInfo {
        public string? Caption { get; set; }
    }
}
