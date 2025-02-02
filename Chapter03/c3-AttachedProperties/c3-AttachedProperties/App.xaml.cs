namespace c3_AttachedProperties {
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
