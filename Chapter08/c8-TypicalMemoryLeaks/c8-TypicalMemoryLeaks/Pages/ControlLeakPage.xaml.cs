namespace TypicalMemoryLeaks.Pages;

public partial class ControlLeakPage : ContentPage
{
    public ControlLeakPage()
    {
        InitializeComponent();
        //For reference counting only
        MemoryHelper.Objects.Add(new WeakReference(this));

        //Step 5
        //this.Disappearing += ControlLeakPage_Disappearing;
    }

    //Step 5
    //private void ControlLeakPage_Disappearing(object sender, EventArgs e)
    //{
    //    rootGrid.Children.Remove(customLabel);
    //}
}
public class CustomLabel : Label
{
    public CustomLabel()
    {
        DeviceDisplay.Current.MainDisplayInfoChanged += Current_MainDisplayInfoChanged;
    }

    private void Current_MainDisplayInfoChanged(object sender, DisplayInfoChangedEventArgs e)
    {
        if (e.DisplayInfo.Orientation == DisplayOrientation.Portrait)
        {
            //...
        }
        else
        {
            //...
        }
    }
}