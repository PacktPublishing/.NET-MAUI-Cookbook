using Microsoft.Maui.Controls;
using Microsoft.Maui.Platform;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace с7_CustomizeExistingHandler
{
    public partial class CustomEntryHandler
    {
        static partial void MapSelectionColor(CustomEntryHandler handler, CustomEntry entry)
        {
            if (handler.PlatformView != null)
            {
                handler.PlatformView.SelectionHighlightColor = new Microsoft.UI.Xaml.Media.SolidColorBrush(entry.SelectionColor.ToWindowsColor());
                //entry.SelectionColor.ToUIColor();
            }
        }
    }
    //public static partial class ColorExtensions
    //{
    //    public static Windows.UI.Color ToWindowsColor(this Microsoft.Maui.Graphics.Color color)
    //    {
    //        return Windows.UI.Color.FromArgb(
    //            (byte)(color.Alpha * 255),
    //            (byte)(color.Red * 255),
    //            (byte)(color.Green * 255),
    //            (byte)(color.Blue * 255)
    //        );
    //    }
    //}
}
