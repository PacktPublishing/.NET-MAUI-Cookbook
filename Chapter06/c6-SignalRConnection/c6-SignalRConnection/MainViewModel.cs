using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.AspNetCore.SignalR.Client;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c6_SignalRConnection
{
    public partial class MainViewModel : ObservableObject
    {
        HubConnection hubConnection;
        bool isBidAccepted;

        [ObservableProperty]
        ObservableCollection<BidData> bids = new ObservableCollection<BidData>();

        [RelayCommand]
        async Task Initialize()
        {
            hubConnection = new HubConnectionBuilder()
                .WithUrl("[Your Dev Tunnel Address]/auction")
                .Build();
            hubConnection.On<BidData>("BidReceived", bid =>
            {
                Bids.Insert(0, bid);
            });
            await hubConnection.StartAsync();
        }

        [RelayCommand(CanExecute = nameof(CanAcceptBid))]
        async Task AcceptBid(BidData bid)
        {
            await hubConnection.InvokeCoreAsync("AcceptBid", args: [bid.Bidder]);
            isBidAccepted = true;
        }
        bool CanAcceptBid() => !isBidAccepted;
    }

    public class BidData(string bidder, decimal price)
    {
        public string Bidder { get; set; } = bidder;
        public decimal Price { get; set; } = price;
    }
}
