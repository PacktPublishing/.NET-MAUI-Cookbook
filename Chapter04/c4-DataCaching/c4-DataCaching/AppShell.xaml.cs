using c4_LocalDatabaseConnection.Views;

namespace c4_LocalDatabaseConnection {
    public partial class AppShell : Shell {
        public AppShell() {
            InitializeComponent();
            Routing.RegisterRoute(nameof(CustomerEditPage), typeof(CustomerEditPage));
            Routing.RegisterRoute(nameof(CustomerDetailPage), typeof(CustomerDetailPage));
        }
    }
}
