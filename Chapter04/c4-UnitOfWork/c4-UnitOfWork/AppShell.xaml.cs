using c4_LocalDatabaseConnection.Views;

namespace c4_LocalDatabaseConnection {
    public partial class AppShell : Shell {
        public AppShell() {
            InitializeComponent();
            Routing.RegisterRoute(nameof(CustomerDetailsForm), typeof(CustomerDetailsForm));
            Routing.RegisterRoute(nameof(CustomerEditForm), typeof(CustomerEditForm));
        }
    }
}