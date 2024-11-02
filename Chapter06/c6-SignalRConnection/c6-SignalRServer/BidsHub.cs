using Microsoft.AspNetCore.SignalR;

namespace c6_SignalRServer
{
    public class BidsHub : Hub
    {
        public static bool IsAuctionRunning = true;
        public void AcceptBid(string winner)
        {
            IsAuctionRunning = false;
        }
    }
}
