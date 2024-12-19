# Implementing role-based access rules on the server
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.packtpub.com/en-IT/product/net-maui-cookbook-9781835464625)

**In the book, this recipe covers:**
* Creating different user roles, such as Admin and User.
* Setting up an endpoint to delete a user by their associated email address.
* Building an endpoint that checks if the current user has permission to perform the delete action based on their assigned role.
* Creating an endpoint to retrieve information about the current user.
* Creating a user with a specified role programmatically.
* Populating the database with default users for testing.
* Configuring Swagger to handle authorization actions.
* Exploring core APIs related to authorization, including AddRoles, AddAuthorization, AddPolicy, RequireAuthorization, IAuthorizationService, RoleManager, and UserManager.
* Implementing custom access rules based on user claims.

**Note:** This example may not include all the points above. For the complete details, please refer to the book.

This examlpe is focused on the server part. For the client project, refer to [Building a client application connected to the authentication service](/Chapter05/c5-RoleBasedAccessPart2).

## Running the Example
1. Run the project. The process for Visual Studio and VS Code is the same as described at [Creating an authentication service with ASP.NET Core Identity](/Chapter05/c5-AuthenticationService#running-the-example).
2. Test endpoints in Swagger.
  - Expand the **/login** item and click **Try it out**. Set **useCookies** and **useSessionCookies** to `false` and type “_user1@cookbook.com_” as an email and “_123Password123!_” as a password.
  - Copy the accessToken value from the response body.
  - Click the **Authorize** button in the top right corner of the page and paste the copied token to the **Value** field. Click **Authorize** to proceed.
  - Expand the **/me** item, click **Try it out** and then **Execute**. You should see information about the current user in the response body.
  - Expand the **/users/{email}** item, click **Try it out**, enter “_user2@cookbook.com_” to the **Email** field and click **Execute**. You should see a 401 error which means that the current user cannot access this endpoint.
  - Repeat all these steps starting with the **/login** endpoint, but now use “_admin@cookbook.com_” as an email in the request body. After getting the token and authorizing as an admin user, you should be able to delete a user using the **/users/{email}** endpoint.

## Output
![Role-Based Access Service](/Images/Role-Based%20Access%20Service.png)
