using CommunityToolkit.Maui.Core.Platform;

namespace c6_OfflineDataSyncClient
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            newTodoEntry.HideKeyboardAsync(CancellationToken.None);
        }
    }

}
