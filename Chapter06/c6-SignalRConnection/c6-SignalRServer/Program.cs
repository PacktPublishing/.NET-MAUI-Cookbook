using c6_SignalRServer;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddSignalR();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapHub<BidsHub>("/auction");

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var hubContext = services.GetRequiredService<IHubContext<BidsHub>>();
    _ = Task.Run(async () =>
    {
        Random rnd = new Random();
        int price = 1;
        while (BidsHub.IsAuctionRunning)
        {
            price = rnd.Next(price, price + 10);
            await hubContext.Clients.All.SendAsync("BidReceived",
                new { Bidder = $"Company{rnd.Next(1, 10)}", Price = price });
            await Task.Delay(rnd.Next(500, 3000));
        }
    });
}

app.Run();

