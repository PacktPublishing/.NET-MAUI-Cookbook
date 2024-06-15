using CommunityToolkit.Maui.Animations;
using CommunityToolkit.Maui.Extensions;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Diagnostics;
using System.Windows.Input;

namespace c3_CustomAnimations {
    public partial class MainPage : ContentPage {
        public MainPage() {
            InitializeComponent();
        }
    }

    class AttentionAnimation : BaseAnimation {
        public override async Task Animate(VisualElement view, CancellationToken token = default) {
            for (int i = 0; i < 6; i++) {
                await view.FadeTo(0.5, Length, Easing);
                await view.FadeTo(1, Length, Easing);
            }
        }
    }

}
