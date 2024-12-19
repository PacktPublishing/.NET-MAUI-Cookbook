# Sending real-time updates from the server using SignalR
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.packtpub.com/en-IT/product/net-maui-cookbook-9781835464625)

**In the book, this recipe covers:**
- Creating an ASP.NET Core service with SignalR support.
- Sending real-time updates from the server to all connected clients.
- Handling data updates received from the server in a .NET MAUI app.
- Sending messages from a client to the server.
- Sending messages to a separate group of clients. 

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example

Activate a Dev Tunnel, then start the server and client projects as described at [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient#running-the-example).

## Output
Bids are received from the server and displayed in a `CollectionView`. Users can tap the **Accept** button to accept a bid, which sends a message back to the server to stop further bids.
![SignalR Updates](/Images/SignalR%20Updates.png)
