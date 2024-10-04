namespace TypicalMemoryLeaks.Pages;

public partial class SinglegonPage : ContentPage
{
	public SinglegonPage()
	{
		InitializeComponent();
        //For reference counting only
        MemoryHelper.Objects.Add(new WeakReference(this));
    }
}