using Android.Content.Res;
using Android.Graphics.Drawables;
using AndroidX.AppCompat.Widget;
using Google.Android.Material.Button;
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
            AppCompatEditText editor = (AppCompatEditText)platformView;
            editor.SetHighlightColor(Android.Graphics.Color.Argb(255, 0, 255, 209));
        }
    }
}
