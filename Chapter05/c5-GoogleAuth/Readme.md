# Signing in with a Google account
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-authentication-interactivity/dp/1835461123)

**In the book, this recipe covers:**
* Setting up an account in the Google Developer Console.
* Obtaining the OAuth Client ID and Client Secret.
* Configuring the ASP.NET Core server to work with Google authentication.
* Creating a user in the server database based on their Google account.
* Enabling authentication on the client using `WebAuthenticator`.
* Overview of the OpenID Connect-based authentication process.
* Typical issues you may encounter when implementing authentication with Google OAuth.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example

1. Configure your account in the Google Developer Console to obtain your Google Client ID and Client Secret. The detailed process is outlined in the recipe in this book.
2. In the _c5-AuthenticationService_ project, replace "**YOUR GOOGLE CLIENT ID**" and "**YOUR GOOGLE CLIENT SECRET**" with the corresponding values from the Google Developer Console.
3. Activate a Dev Tunnel, then start the server and client projects as described in [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient#running-the-example).

## Output
![Google Sign In](/Images/Google%20Sign%20In.png)
