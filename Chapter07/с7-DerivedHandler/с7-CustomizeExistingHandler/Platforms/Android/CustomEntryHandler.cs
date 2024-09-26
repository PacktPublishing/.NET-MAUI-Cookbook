using AndroidX.AppCompat.Widget;
using Microsoft.Maui.Controls.Compatibility.Platform.Android;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace с7_CustomizeExistingHandler
{
    public partial class CustomEntryHandler
    {
        protected override void ConnectHandler(AppCompatEditText platformView)
        {
            base.ConnectHandler(platformView);
            MapSelectionColor(this, (CustomEntry)VirtualView);
        }
        static partial void MapSelectionColor(CustomEntryHandler handler, CustomEntry entry)
        {
            handler.PlatformView?.SetHighlightColor(entry.SelectionColor.ToAndroid());
        }
    }
}
