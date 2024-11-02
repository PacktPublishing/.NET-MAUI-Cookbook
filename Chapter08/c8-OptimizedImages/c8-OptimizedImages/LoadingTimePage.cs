using Microsoft.Maui.Handlers;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c8_DebugVsRelease
{
    public class LoadingTimePage : ContentPage
    {
        static Stopwatch LoadingStopwatch = new Stopwatch();
        public static void StartTimer() => LoadingStopwatch.Restart();
        public static void ShowTimeElapsed()
        {
            LoadingStopwatch.Stop();
            Shell.Current.DisplayAlert("Elapsed miliseconds", LoadingStopwatch.ElapsedMilliseconds.ToString(), "OK");
        }
    }
    public partial class LoadingTimePageHandler : PageHandler { }
}
