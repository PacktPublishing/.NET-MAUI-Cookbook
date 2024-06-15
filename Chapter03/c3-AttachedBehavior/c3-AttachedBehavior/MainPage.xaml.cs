using Microsoft.Maui.Controls;

namespace c3_AttachedBehavior {
    public partial class MainPage : ContentPage {
        public MainPage() {
            InitializeComponent();
        }
    }
    public class DoubleTapToZoomBehavior : Behavior<Image> {
        Image image;
        bool isZoomed;
        TapGestureRecognizer tapGestureRecognizer;
        public double ScaleFactor {
            get { return (double)GetValue(ScaleFactorProperty); }
            set { SetValue(ScaleFactorProperty, value); }
        }
        public static readonly BindableProperty ScaleFactorProperty =
            BindableProperty.Create("ScaleFactor", typeof(double), typeof(DoubleTapToZoomBehavior), 2d);
        protected override void OnAttachedTo(Image bindable) {
            base.OnAttachedTo(bindable);
            tapGestureRecognizer = new TapGestureRecognizer() {
                NumberOfTapsRequired = 2
            };
            image = bindable;
            tapGestureRecognizer.Tapped += OnImageDoubleTap;
            image.GestureRecognizers.Add(tapGestureRecognizer);
        }
        protected override void OnDetachingFrom(Image bindable) {
            base.OnDetachingFrom(bindable);
            image.GestureRecognizers.Remove(tapGestureRecognizer);
            tapGestureRecognizer.Tapped -= OnImageDoubleTap;
            image = null;
        }
        private void OnImageDoubleTap(object sender, TappedEventArgs e) {
            Point? tappedPoint = e.GetPosition(image);
            if (isZoomed) {
                image.ScaleTo(1);
                image.TranslateTo(0, 0);
            }
            else {
                double translateFactor = ScaleFactor - 1;
                double traslateX = (image.Width / 2 - tappedPoint.Value.X) * translateFactor;
                double traslateY = (image.Height / 2 - tappedPoint.Value.Y) * translateFactor;
                image.TranslateTo(traslateX, traslateY);
                image.ScaleTo(ScaleFactor);
            }
            isZoomed = !isZoomed;
        }

    }
}
