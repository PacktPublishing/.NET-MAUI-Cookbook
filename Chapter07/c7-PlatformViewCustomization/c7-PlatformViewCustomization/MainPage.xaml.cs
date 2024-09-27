namespace c7_CustomizeHandler
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        void OnEntryHandlerChanged(object sender, EventArgs e)
        {
            Entry entry = (Entry)sender;
            PlatformCustomizer.CustomizeEntry(entry.Handler.PlatformView);
        }
    }

    public static partial class PlatformCustomizer
    {
        public static partial void CustomizeEntry(object platformView);
    }
}
