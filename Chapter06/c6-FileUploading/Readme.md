# Uploading large files in chunks to a server
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.packtpub.com/en-IT/product/net-maui-cookbook-9781835464625)

**In the book, this recipe covers:**
- Setting up an ASP.NET Core service with an endpoint to receive large files in chunks.
- Splitting a file into chunks in a .NET MAUI client app.
- Reassembling chunks into a complete file on the server and saving it.
- Showing upload progress to the user.
- Advantages of chunked file uploading.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example

Activate a Dev Tunnel, then start the server and client projects as described at [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient#running-the-example).

If you’re using an emulator, make sure to upload a test file. You can either download a file using a browser on the emulator or drag and drop a file from your desktop machine to the emulator. 

**Note:** During testing, Dev Tunnel may significantly reduce upload speed.

## Output
![Chunk file uploading in .NET MAUI](/Images/File%20Uploading.png)
