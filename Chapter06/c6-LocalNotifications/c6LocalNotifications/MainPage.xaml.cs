using Plugin.LocalNotification;
using Plugin.LocalNotification.EventArgs;

namespace c6LocalNotifications
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
            LocalNotificationCenter.Current.NotificationActionTapped += OnNotificationActionTapped;
        }
        private async void OnNotificationActionTapped(NotificationActionEventArgs e)
        {
            if (e.IsTapped)
            {
                //...
                return;
            }
            if (e.IsDismissed)
            {
                //...
                return;
            }
            switch (e.ActionId)
            {
                //...
            }
        }
        private void OnCounterClicked(object sender, EventArgs e)
        {
            var request = new NotificationRequest
            {
                NotificationId = 123,
                Title = ".NET MAUI Cookbook",
                Description = "Tap me to activate",
                BadgeNumber = 2,
                Schedule = new NotificationRequestSchedule
                {
                    NotifyTime = DateTime.Now.AddSeconds(7),
                },
            };
            LocalNotificationCenter.Current.Show(request);
        }

        private async void OnLoaded(object sender, EventArgs e)
        {
            if (await LocalNotificationCenter.Current.AreNotificationsEnabled() == false)
            {
                await LocalNotificationCenter.Current.RequestNotificationPermission();
            }
        }
    }

}
