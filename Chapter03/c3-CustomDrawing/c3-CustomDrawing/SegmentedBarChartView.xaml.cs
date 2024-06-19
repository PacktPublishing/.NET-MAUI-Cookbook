
namespace c3_DarkAndLightThemes;

public partial class SegmentedBarChartView : ContentView {
    public float Value {
        get { return (float)GetValue(ValueProperty); }
        set { SetValue(ValueProperty, value); }
    }

    public static readonly BindableProperty ValueProperty =
        BindableProperty.Create("Value",
            typeof(float),
            typeof(SegmentedBarChartView),
            defaultValue: 0f,
            propertyChanged: (b, o, n) => ((SegmentedBarChartView)b).OnValueChanged());

    void OnValueChanged() {
        ((BarChartDrawable)graphicsView.Drawable).Value = Value;
        graphicsView.Invalidate();
    }

    public SegmentedBarChartView() {
        InitializeComponent();
    }
}