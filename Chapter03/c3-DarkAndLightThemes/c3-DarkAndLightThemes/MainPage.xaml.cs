using CommunityToolkit.Mvvm.ComponentModel;
using static Android.Content.Res.Resources;

namespace c3_DarkAndLightThemes {
    public partial class MainPage : ContentPage {
        public MainPage() {
            InitializeComponent();
        }
    }


    public partial class ThemeInfo {
        public static ThemeInfo System = new(AppTheme.Unspecified, "System");
        public static ThemeInfo Light = new(AppTheme.Light, "Light");
        public static ThemeInfo Dark = new(AppTheme.Dark, "Dark");
        public AppTheme AppTheme { get; }
        public string Caption { get; }

        public ThemeInfo(AppTheme theme, string caption) {
            AppTheme = theme;
            Caption = caption;
        }
    }
    public partial class ThemeSettings : ObservableObject {
        public static List<ThemeInfo> ThemesList { get; } = new List<ThemeInfo>() {
            ThemeInfo.System,
            ThemeInfo.Light,
            ThemeInfo.Dark
        };
        public static ThemeSettings Current { get; } = new ThemeSettings();

        [ObservableProperty]
        public ThemeInfo selectedTheme = ThemesList.First();

        partial void OnSelectedThemeChanged(ThemeInfo oldValue, ThemeInfo newValue) {
            Application.Current.UserAppTheme = newValue.AppTheme;
        }
    }
}
