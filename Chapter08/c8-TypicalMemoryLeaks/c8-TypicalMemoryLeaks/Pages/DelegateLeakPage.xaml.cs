using Microsoft.Maui.Animations;

namespace TypicalMemoryLeaks.Pages;

public partial class DelegateLeakPage : ContentPage
{
    public DelegateLeakPage()
    {
        InitializeComponent();
        //For reference counting only
        MemoryHelper.Objects.Add(new WeakReference(this));

        //Issue
        Dispatcher.StartTimer(TimeSpan.FromSeconds(1), TimerTick);


        //Step 2
        //timer = Dispatcher.CreateTimer();
        //timer.Interval = TimeSpan.FromSeconds(1);
        //Appearing += OnAppearing;
        //Disappearing += OnDisappearing;
    }

    int ticks = 0;
    bool TimerTick()
    {
        timerValueLabel.Text = ticks.ToString();
        ticks++;
        return true;
    }

    //Step 2
    //private void TickEventHandler(object sender, EventArgs e) =>
    //    TimerTick();

    //IDispatcherTimer timer;
    //private void OnAppearing(object sender, EventArgs e)
    //{
    //    timer.Tick += TickEventHandler;
    //    timer.Start();
    //}
    //private void OnDisappearing(object sender, EventArgs e)
    //{
    //    timer.Stop();
    //    timer.Tick -= TickEventHandler;
    //}
}