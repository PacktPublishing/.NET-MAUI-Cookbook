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
        class CustomViewController(IView page, IMauiContext mauiContext) : PageViewController(page, mauiContext)
        {
            public override void ViewDidAppear(bool animated)
            {
                base.ViewDidAppear(animated);
                LoadingTimePage.ShowTimeElapsed();
            }
        }
        protected override Microsoft.Maui.Platform.ContentView CreatePlatformView()
        {
            if (ViewController == null)
                ViewController = new CustomViewController(VirtualView, MauiContext);
            if (ViewController is PageViewController pc && pc.CurrentPlatformView is Microsoft.Maui.Platform.ContentView pv)
                return pv;
            if (ViewController.View is Microsoft.Maui.Platform.ContentView cv)
                return cv;
            throw new InvalidOperationException($"PageViewController.View must be a {nameof(Microsoft.Maui.Platform.ContentView)}");
        }
    }
}
