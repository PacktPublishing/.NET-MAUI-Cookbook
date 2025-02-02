using Microsoft.Maui.Storage;

namespace c4_LocalDatabaseConnection {
    public partial class App : Application {
        public App() {
            InitializeComponent();
        }
        protected override Window CreateWindow(IActivationState activationState)
        {
            return new Window(new AppShell());
        }
    }
}
