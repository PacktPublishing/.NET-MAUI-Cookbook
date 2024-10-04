using TypicalMemoryLeaks;

namespace TypicalMemoryLeaks.Pages;

public partial class EventLeakPage : ContentPage
{
    public EventLeakPage()
    {
        InitializeComponent();
        //For reference counting only
        MemoryHelper.Objects.Add(new WeakReference(this));

        //Issue. Solution in App.xaml.cs (step 3)
        ((App)App.Current).CustomEvent += EventLeakPage_CustomEvent;
    }

    private void EventLeakPage_CustomEvent(object sender, EventArgs e)
    {

    }
}