using Microsoft.Maui.Controls.PlatformConfiguration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UIKit;

namespace c7_CustomizeHandler
{
    public static partial class PlatformCustomizer
    {
        public static partial void CustomizeEntry(object platformView)
        {
            UITextField editor = (UITextField)platformView;
            editor.TintColor = UIColor.FromRGBA(0, 255, 209, 255);
        }
    }
}
