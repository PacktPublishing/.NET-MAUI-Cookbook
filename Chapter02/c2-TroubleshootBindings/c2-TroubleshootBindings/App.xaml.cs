namespace c2_TroubleshootBindings {
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
