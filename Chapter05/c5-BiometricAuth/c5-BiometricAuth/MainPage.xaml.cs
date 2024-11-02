using Plugin.Maui.Biometric;

namespace c5_BiometricAuth
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }
        private async void OnCounterClicked(object sender, EventArgs e)
        {
            var result = await BiometricAuthenticationService.Default.AuthenticateAsync(new AuthenticationRequest()
            {
                Title = "Touch the fingerprint sensor",
                NegativeText = "Cancel"
            }, CancellationToken.None);

            if (result.Status == BiometricResponseStatus.Success)
            {
                await DisplayAlert("Success", "System user fingerprint is recognized", "OK");
            }
            else
            {
                await DisplayAlert("Rejected", "Couldn't authenticate", "OK");
            }
        }
    }
}
