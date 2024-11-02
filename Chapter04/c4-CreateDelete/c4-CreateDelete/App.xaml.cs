using Microsoft.Maui.Storage;

namespace c4_LocalDatabaseConnection {
    public partial class App : Application {
        public App() {
            SQLitePCL.Batteries_V2.Init();
            using var context = new CrmContext();
            context.Database.EnsureCreated();

            InitializeComponent();
            MainPage = new AppShell();
        }
    }
}
