using Microsoft.Maui.Controls.Compatibility.Platform.iOS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c7_DerivedHandler
{
    public partial class CustomEntryHandler
    {
        static partial void MapSelectionColor(CustomEntryHandler handler, CustomEntry entry)
        {
            if (handler.PlatformView != null)
            {
                handler.PlatformView.TintColor = entry.SelectionColor.ToUIColor();
            }
        }
    }
}
