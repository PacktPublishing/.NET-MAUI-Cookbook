namespace TypicalMemoryLeaks.Pages;

public partial class DirectReferenceLeakPage : ContentPage
{
    public DirectReferenceLeakPage()
    {
        InitializeComponent();
        //For reference counting only
        MemoryHelper.Objects.Add(new WeakReference(this));

        //Issue
        ((App)App.Current).OpenedChildPages.Add(this);

        //Step 4
        //((App)App.Current).OpenedChildPages.Add(new WeakReference(this));
    }
}