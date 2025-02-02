using Microsoft.Maui.Storage;

namespace c4_LocalDatabaseConnection {
    public partial class App : Application {
        public App() {
            using var context = new CrmContext();
            SQLitePCL.Batteries_V2.Init();
            context.Database.EnsureCreated();

            InitializeComponent();
        }
        protected override Window CreateWindow(IActivationState activationState)
        {
            return new Window(new AppShell());
        }
    }
}
