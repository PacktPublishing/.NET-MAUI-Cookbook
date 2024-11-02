# Connecting to a remote web API service
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-authentication-interactivity/dp/1835461123)

**In the book, this recipe covers:**
* The basics of connecting to a Web API service from a .NET MAUI app.
* Modifying the existing repository to interact with a Web API service.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example

### Visual Studio
1. Run the *c4-WebApiServer* project without debugging.

![Starting a WebAPI service without debugging](/Images/Starting%20without%20debugging.png)

2. Select *c4-WebApiMauiClient* as startup project.

![Selecting the startup project](/Images/Selecting%20the%20startup%20project.png)

3. Select the debugging device.

![Selecting the device](/Images/Selecting%20the%20device.png)

4. Start debugging the *c4-WebApiMauiClient* project.

### VS Code
1. Open the folder with the solution (**File | Open Folder**) and in in the Terminal window, run the following command to navigate to the server folder:
   ```
   cd c4-WebApiServer
   ```
2. Start the server using the `https` profile defined in **Properties | launchSettings.json** by running:
    ```
    dotnet run --launch-profile https
    ```
    The server should start on port `7197`, as specified in the [launchSettings.json](./c4-WebApiServer/Properties/launchSettings.json) file.
3. Open this URL in your browser to view Swagger: `https://localhost:7197/swagger`
4. To run the client .NET MAUI project, use either the [.NET Meteor](https://marketplace.visualstudio.com/items?itemName=nromanov.dotnet-meteor) or [.NET MAUI](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-maui) VS Code extensions. Follow the setup steps in each extension's documentation to get started.

## Output
![MAUI Web API](/Images/MAUI%20and%20Web%20API.png)
