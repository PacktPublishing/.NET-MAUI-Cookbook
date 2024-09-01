using Microsoft.AspNetCore.SignalR.Client;

namespace c6_SignalRConnection
{
    public partial class MainPage : ContentPage
    {
        
        //HubConnection connection = new HubConnectionBuilder().WithUrl("https://zz4kwzzx-7223.asse.devtunnels.ms/chat").Build();

        public MainPage()
        {
            InitializeComponent();
            //connection.On<string>("MessageRecieved", message => {
            //    test.Text = message;
            //});
        }


        //HttpClient client = new HttpClient() { BaseAddress = new Uri("http://10.0.2.2:5171") };
        //private async void OnCounterClicked(object sender, EventArgs e)
        //{
        //    //var response = await client.GetAsync("/test");
        //    await connection.StartAsync();
        //    await connection.InvokeCoreAsync("SendMessage", args: new[] { "test" });
        //}
    }

}
