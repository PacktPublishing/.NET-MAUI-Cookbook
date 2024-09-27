using Microsoft.Maui.Controls.PlatformConfiguration;
using Microsoft.Maui.Platform;
using Microsoft.UI.Xaml.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c7_CustomizeHandler
{
    public static partial class PlatformCustomizer
    {
        public static partial void CustomizeEntry(object platformView)
        {
            TextBox editor = (TextBox)platformView;
            editor.SelectionHighlightColor = new Microsoft.UI.Xaml.Media.SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 209));
        }
    }
}
