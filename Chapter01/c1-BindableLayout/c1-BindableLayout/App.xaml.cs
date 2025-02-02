namespace c1_BindableLayout {
    public partial class App : Application {
        public App() {
            InitializeComponent();
        }
        protected override Window CreateWindow(IActivationState activationState)
        {
            return new Window(new AppShell());
        }
    }
}
