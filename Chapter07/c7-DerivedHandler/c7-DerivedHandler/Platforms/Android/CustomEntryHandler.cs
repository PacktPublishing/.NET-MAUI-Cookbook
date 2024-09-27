using AndroidX.AppCompat.Widget;
using Microsoft.Maui.Controls.Compatibility.Platform.Android;

namespace c7_DerivedHandler
{
    public partial class CustomEntryHandler
    {
        static partial void MapSelectionColor(CustomEntryHandler handler, CustomEntry entry)
        {
            handler.PlatformView?.SetHighlightColor(entry.SelectionColor.ToAndroid());
        }
    }
}
