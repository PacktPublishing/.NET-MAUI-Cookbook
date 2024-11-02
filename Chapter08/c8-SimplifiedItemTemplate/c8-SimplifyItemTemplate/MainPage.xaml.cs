namespace c8_DebugVsRelease
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();

        }

        async void OnOpenTestPageClicked(object sender, EventArgs e)
        {
            LoadingTimePage.StartTimer();
            await Shell.Current.GoToAsync(nameof(TestPage), false);
        }
    }

}
