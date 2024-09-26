
using CommunityToolkit.Maui.Core.Platform;

namespace c6_OfflineDataSyncClient
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void OnAddClicked(object sender, EventArgs e)
        {
            newBlogEntry.HideKeyboardAsync(CancellationToken.None);
        }
    }

}
