using Microsoft.Maui;

namespace TypicalMemoryLeaks
{
    public partial class App : Application
    {
        public event EventHandler<EventArgs> CustomEvent;

        //Step 3
        //readonly WeakEventManager _weakEventManager = new WeakEventManager();
        //public event EventHandler<EventArgs> CustomEvent
        //{
        //    add => _weakEventManager.AddEventHandler(value);
        //    remove => _weakEventManager.RemoveEventHandler(value);
        //}


        //Step 4
        //public List<WeakReference> OpenedChildPages = new List<WeakReference>();
        public List<ContentPage> OpenedChildPages = new List<ContentPage>();

        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();
        }
    }
}