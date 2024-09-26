namespace c7_ConditionalCompilation
{
    public partial class MainPage : ContentPage
    {

        public MainPage()
        {
            InitializeComponent();
#if ANDROID
            label.Text = "Android";
#elif IOS
            label.Text = "iOS";
#elif WINDOWS
            label.Text = "Windows";
#elif MACCATALYST
            label.Text = "Mac";
#endif
        }

    }

}
