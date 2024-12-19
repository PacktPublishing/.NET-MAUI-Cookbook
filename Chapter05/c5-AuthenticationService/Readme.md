# Creating an authentication service with ASP.NET Core Identity
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.packtpub.com/en-IT/product/net-maui-cookbook-9781835464625)

**In the book, this recipe covers:**
* Building a basic authentication service using ASP.NET Core Identity.
* Setting up essential identity components like `IdentityUser` and `IdentityDbContext`.
* Configuring access token generation for secure authentication.
* Registering a new user through the Swagger UI.
* An overview of the ASP.NET Core Identity framework.
* Setting up a Dev Tunnel for easy access to the service from any debugging device.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

This examlpe contains only the server part. For the client project, refer to [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient).

## Running the Example

1. Run the project.
  * In Visual Studio, start debugging the project and a browser with the Swagger UI should automatically appear.
  * In VS Code, open the solution folder and navigate to the project folder by running the following command:
    ```shell
     cd c5-AuthenticationService
    ```
    After that, run the project:
    ```
    dotnet run --launch-profile https
    ```
    The server should start on port `7158`, as specified in the [launchSettings.json](./c5-AuthenticationService/Properties/launchSettings.json#L27C44-L27C48) file. Open this URL in your browser to view Swagger: `https://localhost:7158/swagger`
2. Register a new user.
  - In Swagger opened in your browser after step 1, expand the **/register** item and click **Try it out**
  - In the **Request body** section, enter an email and password for a new user and click Execute
  ```json
  { 
    "email": "test@test.com", 
    "password": "123Password123!" 
  }
  ```
  - Log in using the specified credentials. Expand the **/login** item and click **Try it out**. Since bearer token authentication is used, select `false` for **useCookies** and **useSessionCookies**
  - In the **Request body** section, enter the email and password specified earlier. Leave other parameters at their default values.
  - In Response Body, you should see a text similar to:
  ```json
  { 
    "tokenType": "Bearer", 
    "accessToken": "CfDJ8ENrCbboN0tArI5SaUti2haO…", 
    "expiresIn": 3600, 
    "refreshToken": "CfDJ8ENrCbboN0tArI5SaUti2hY…" 
  } 
  ```
  This means you’ve successfully logged in with the newly created user, and the server has sent an access token that you can use in future requests to call protected endpoints.

## Output
![Authentication Service in Swagger](/Images/Authentication%20Service%20in%20Swagger.png)
