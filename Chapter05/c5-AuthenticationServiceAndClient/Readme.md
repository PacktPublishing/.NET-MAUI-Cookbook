# Building a client application connected to the authentication service
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-full-featured-authentication-ebook/dp/B0DHV34WQ5)

**In the book, this recipe covers:**
* Building a simple login form that connects to authentication endpoints using a username and password.
* Saving the received authorization token in the request header for accessing protected endpoints.
* Enabling a Dev Tunnel for testing and debugging.
* Organizing server communication logic into a separate class to maintain a clean architecture.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example
It's recommended that you activate a [Dev Tunnel](https://learn.microsoft.com/en-us/azure/developer/dev-tunnels/overview) to connect the server from the mobile client. This approach helps avoid different addresses for Android and iOS and lets you connect to the service from a physical device using HTTPS without extra configuration. Dev Tunnel setup is explained for both Visual Studio and VS Code (which is helpful for Mac users). 

To test authentication on the client, you need to create a user on the server. This process is described at [Creating an authentication service with ASP.NET Core Identity](/Chapter05/c5-AuthenticationService#running-the-example).

### Visual Studio
#### Set up Dev Tunnel
1. Right-click the *c5-AuthenticationService* project and select **Set as Startup Project**.
2. Click the dropdown arrow next to the **Start Debugging** button and select **Dev Tunnels | Create a Tunnel**.

  ![Create Tunnel](/Images/Create%20a%20Tunnel.png)

3. Log in if prompted. You can use your Microsoft, GitHub, or Entra ID account. Name your tunnel, select **Persistent** in **Tunnel Type**, and **Public** in **Access**.:

  ![New Tunnel Settings](/Images/New%20tunnel%20settings%20dialog.png)

4. Run the project to activate the tunnel. A browser should open with a message informing you that you are about to connect to the tunnel. Click **Continue** to proceed. Now you can find the address of the Dev Tunnel in the browser's URL string.
5. Open the **Dev Tunnels** window by selecting **Debug Dropdown | Dev Tunnels | Show Dev Tunnels Window**.

  ![Show Dev Tunnels](/Images/Show%20Dev%20Tunnels.png)

6. Click the **Settings** icon and check **Use Tunnel Domain**. This operation might take 1-2 minutes: 
  ![Show Dev Tunnels](/Images/Use%20Tunnel%20Domain.png)

#### Run the server and client
1. Run the *c5-AuthenticationService* project without debugging by right-clicking it and selecting **Debug | Run Without Debugging**.
2. In the _c5-AuthenticationClient_ project, set the `WebService.baseAddress` field to the Dev Tunnel URL obtained in  the _Set up Dev Tunnel_ section (step 4). Make sure to keep the trailing slash.
3. Right-click the _c5-AuthenticationClient_ project and set it as the **Startup Project**.
4. Select the debugging device.

  ![Selecting the device](/Images/Selecting%20the%20device.png)
  
5. Start debugging the _c5-Authentication**Client**_ project.

### VS Code
#### Set up Dev Tunnel  
1. Install the Dev Tunnel package:
   - On macOS, open **Terminal** and use **Homebrew (brew)**:
     ```shell
     brew install --cask devtunnel
     ```
   - On Windows, open **Command Prompt** and use **Windows Package Manager (winget)**:
     ```shell
     winget install Microsoft.devtunnel
     ```
     Restart the Command Prompt to refresh environment variables.
2. Log in with a Microsoft Entra ID, Microsoft, or GitHub account:
```shell
devtunnel user login
```
3. Create a new Dev Tunnel named `mytunnel`. Set the `host-header` parameter to `unchanged` to prevent overridng the tunnel's HTTP host header to `localhost` which is essential when will use this tunnel with for sigining in with a Google account.
```shell
devtunnel create mytunnel -a --host-header unchanged
```
4. Specify the tunnel's port and protocol:
```shell
devtunnel port create mytunnel -p 7158 --protocol https
```
This port should match the value in [launchSettings.json](./c5-AuthenticationService/Properties/launchSettings.json#L27C44-L27C48).
5. Start hosting the dev tunnel:
```shell
devtunnel host mytunnel
```
You should see output like this:
```shell
Hosting port: 7158
Connect via browser: <https://dq643db8-7158.uks1.devtunnels.ms>
Inspect network activity: <https://dq643db8-7158-inspect.uks1.devtunnels.ms>
```
Now you can use the specified URL to access your service hosted on port 7158.

#### Run the server and client
1. In VS Code, open the root solution folder and set the `WebService.baseAddress` in the _c5-AuthenticationClient_ project to the Dev Tunnel URL obtained in the _Set up Dev Tunnel_ section (step 5). Ensure the URL ends with a slash.
2. In VS Code, open a Terminal window and navigate to the *c5-AuthenticationService* folder.
```shell
   cd c5-AuthenticationService
```
3. Start the server using the `https` profile defined in **Properties | launchSettings.json** by running
```shell
dotnet run --launch-profile https
```
The server should start on port `7158`, as specified in the [launchSettings.json](./c5-AuthenticationService/Properties/launchSettings.json#L27C44-L27C48) file.
3. Open the Dev Tunnel URL in your browser and add `swagger` to the path to see the Swagger UI: _https://[YOUR DEV TUNNEL ADDRESS]/swagger_
4. To run the client .NET MAUI project, use either the [.NET Meteor](https://marketplace.visualstudio.com/items?itemName=nromanov.dotnet-meteor) or [.NET MAUI](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-maui) VS Code extensions. Follow the setup steps in each extension's documentation to get started.

## Output
![Basic authentication](/Images/Basic%20Authentication.png)
