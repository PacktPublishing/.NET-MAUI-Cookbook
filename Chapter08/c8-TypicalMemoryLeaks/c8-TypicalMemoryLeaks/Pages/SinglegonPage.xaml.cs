namespace TypicalMemoryLeaks.Pages;

public partial class SingletonPage : ContentPage
{
	public SingletonPage()
	{
		InitializeComponent();
        //For reference counting only
        MemoryHelper.Objects.Add(new WeakReference(this));
    }
}