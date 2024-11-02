using AndroidX.AppCompat.Widget;

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
