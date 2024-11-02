using Android.App;
using Android.Runtime;

namespace c4_LocalDatabaseConnection {
    [Application]
    public class MainApplication : MauiApplication {
        public MainApplication(IntPtr handle, JniHandleOwnership ownership)
            : base(handle, ownership) {
        }

        protected override MauiApp CreateMauiApp() => MauiProgram.CreateMauiApp();
    }
}
