# Building a chat bot with Ollama deployed to a self-hosted server
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-full-featured-authentication-ebook/dp/B0DHV34WQ5)

**In the book, this recipe covers:**
* Key capabilities of [Ollama](https://ollama.com/).
* Configuring Ollama on the server with a pretrained LLM model.
* Creating an ASP.NET Core app with an endpoint that answers user questions by accessing Ollama through the OllamaApiClient.
* Building a simple chat client in .NET MAUI with markdown support.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Running the Example

1. [Download Ollama](https://ollama.com/download).
2. Run the `llama` model by executing the following command:
   ```shell
   ollama run llama3.1
   ```
3. Activate a Dev Tunnel, then start the server and client projects in the same way as described at [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient#running-the-example).
4. Type any text into the input field in the .NET MAUI app and wait for a response from the Ollama model hosted on the server.

## Output
![Authentication Service in Swagger](/Images/Ollama%20Chat.png)
