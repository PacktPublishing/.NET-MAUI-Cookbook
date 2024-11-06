# Managing secured sessions
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-full-featured-authentication-ebook/dp/B0DHV34WQ5)

**In the book, this recipe covers:**
* Implementing user sessions based on access tokens stored in secure storage.
* Encapsulating all session-related logic in a separate service class.
* Obtaining a refresh token when the stored token expires.
* Adding the logout functionality.
* Logging out of the current Google account on the client by passing the `prompt` parameter.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example

1. Activate a Dev Tunnel, then start the server and client projects as outlined in [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient#running-the-example).
2. Log in using the following credentials:

   _**Username:** user1@cookbook.com_  
   _**Password:** 123Password123!_

3. Restart the application to ensure that you can log in automatically using a session next time.
