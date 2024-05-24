namespace c1_OrientationSpecificSettings {
    public partial class MainPage : ContentPage {
        public MainPage() {
            InitializeComponent();
        }
        //Step 2
        //protected override void OnNavigatedTo(NavigatedToEventArgs args) {
        //    base.OnNavigatedTo(args);
        //    SetOrientationSpecificSettings();
        //    DeviceDisplay.MainDisplayInfoChanged += OnMainDisplayInfoChanged;
        //}
        //protected override void OnNavigatedFrom(NavigatedFromEventArgs args) {
        //    base.OnNavigatedFrom(args);
        //    DeviceDisplay.MainDisplayInfoChanged -= OnMainDisplayInfoChanged;
        //}
        //private void OnMainDisplayInfoChanged(object? sender, DisplayInfoChangedEventArgs e) {
        //    SetOrientationSpecificSettings();
        //}
        //void SetOrientationSpecificSettings() {
        //    if (DeviceDisplay.MainDisplayInfo.Orientation == DisplayOrientation.Landscape)
        //        border1.BackgroundColor = Colors.Red;
        //    else
        //        border1.BackgroundColor = Colors.Green;
        //}
    }
}
