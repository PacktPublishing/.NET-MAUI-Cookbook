using Microsoft.Maui.Storage;

namespace c4_LocalDatabaseConnection {
    public partial class App : Application {
        public App() {
            SQLitePCL.Batteries_V2.Init();
            using var context = new CrmContext();
            context.Database.EnsureCreated();

            InitializeComponent();
        }
        protected override Window CreateWindow(IActivationState activationState)
        {
            return new Window(new AppShell());
        }
    }
}
