using System.Globalization;

namespace c2_TroubleshootBindings {
    public partial class MainPage : ContentPage {

        public MainPage() {
            InitializeComponent();
        }
    }

public class DummyConverter : IValueConverter {
    public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
        return null;
    }
    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
        return null;
    }
}
}
