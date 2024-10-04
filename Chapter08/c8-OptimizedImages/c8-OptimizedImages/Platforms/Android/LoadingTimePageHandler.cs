using Android.Views;
using Microsoft.Maui.Handlers;
using Microsoft.Maui.Platform;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c8_DebugVsRelease
{
    public partial class LoadingTimePageHandler
    {
        protected override ContentViewGroup CreatePlatformView()
        {
            var platformView = base.CreatePlatformView();
            platformView.ViewTreeObserver!.AddOnGlobalLayoutListener(new MyGlobalLayoutListener(platformView));
            return platformView;
        }
    }
    class MyGlobalLayoutListener(ContentViewGroup platformView) : Java.Lang.Object, ViewTreeObserver.IOnGlobalLayoutListener
    {
        readonly ContentViewGroup PlatformView = platformView;
        public void OnGlobalLayout()
        {
            LoadingTimePage.ShowTimeElapsed();
            PlatformView.ViewTreeObserver!.RemoveOnGlobalLayoutListener(this);
        }
    }
}
