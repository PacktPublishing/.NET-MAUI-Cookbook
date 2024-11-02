# Synchronizing data between offline and online databases
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-authentication-interactivity/dp/1835461123)

**In the book, this recipe covers:**
- Configuring an ASP.NET Core server with data synchronization support using the [Datasync](https://github.com/CommunityToolkit/Datasync) library.
- Setting up a .NET MAUI client app for both offline and online data synchronization.
- Identifying unsynchronized items to display them distinctly.
- Asynchronous loading and synchronization.
- Overview of key components in Datasync.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example

Activate a Dev Tunnel, then start the server and client projects as described at [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient#running-the-example).

## Output
Users can add new items, which are instantly saved to the local SQLite database and asynchronously synced with a remote database. If items aren’t synchronized (e.g., due to a lost connection), they appear in a different color.
![Datasync app](/Images/Data%20Sync.png)
