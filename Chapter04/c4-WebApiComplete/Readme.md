# Connecting to a remote web API service
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[NET MAUI Cookbook: Fast track to a full-featured app with MVVM, CRUD, AI, authentication, real-time updates and more](https://www.amazon.com/NET-MAUI-Cookbook-authentication-interactivity/dp/1835461123)

**In the book, this recipe covers:**
* The basics of connecting to a Web API service from a .NET MAUI app.
* Modifying the existing repository to interact with a Web API service.

**Note:** This example doesn't include all the points above. For the complete details, please refer to the book.

## To Run the Example

### Visual Studio
1. Run the c4-WebApiServer property without debugging.
![Starting a WebAPI service without debugging](/Images/Starting%20without%20debugging.png)
2. Select c4-WebApiMauiClient as startup project.
![Selecting the startup project](/Images/Selecting%20the%20startup%20project.png)
3. Select the device.
![Selecting the device](/Images/Selecting%20the%20device.png)
4. Start debugging the c4-WebApiMauiClient project.

### VS Code
1. Install the [.NET Meteor](https://marketplace.visualstudio.com/items?itemName=nromanov.dotnet-meteor) extension in VS Code to debug .NET MAUI projects.
2. Open the folder with the solution (**File | Open Folder**).
3. In the Terminal window, run the following command to navigate to the server folder:
   ```
   cd c4-WebApiServer
   ```
4. Start the server using the `https` profile defined in **Properties | launchSettings.json** by running:
    ```
    dotnet run --launch-profile https
    ```
    The server should start on port `7197`, as specified in launchSettings.json.
5. Open this URL in your browser to view Swagger: https://localhost:7197/swagger
6. [Run the .NET MAUI application](https://github.com/JaneySprings/DotNet.Meteor?tab=readme-ov-file#run-the-application).

## Output
![MAUI Web API](/Images/MAUI%20and%20Web%20API.png)
