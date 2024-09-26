namespace с7_CustomizeExistingHandler
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void Button_HandlerChanged(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            object testH = button.Handler.PlatformView;
        }
    }
}
