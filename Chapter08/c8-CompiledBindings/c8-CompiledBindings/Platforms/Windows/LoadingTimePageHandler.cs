using Microsoft.Maui.Handlers;
using Microsoft.Maui.Platform;
using Microsoft.UI.Xaml;

namespace c8_DebugVsRelease
{
    public partial class LoadingTimePageHandler
    {
        protected override void ConnectHandler(ContentPanel platformView)
        {
            base.ConnectHandler(platformView);

            if (platformView is ContentPanel contentPanel)
            {
                contentPanel.Loaded += (s, e) => LoadingTimePage.ShowTimeElapsed();
            }
        }
    }
}
