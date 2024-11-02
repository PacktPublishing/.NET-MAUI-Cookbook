using c5_AuthenticationClient.Views;

namespace c5_AuthenticationClient
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(UsersPage), typeof(UsersPage));
        }
    }
}
