# NET MAUI Cookbook Examples
This repository contains examples for the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github): 

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-full-featured-authentication-ebook/dp/B0DHV34WQ5)

## Before You Begin
Make sure your .NET MAUI environment is set up according to the official guide: [.NET MAUI Installation](https://learn.microsoft.com/en-us/dotnet/maui/get-started/installation?view=net-maui-8.0&tabs=vswin). Some examples also include an ASP.NET Core service, so ensure you have the necessary workloads installed: [ASP.NET Core Prerequisites](https://learn.microsoft.com/en-us/aspnet/core/tutorials/first-web-api?view=aspnetcore-8.0&tabs=visual-studio#prerequisites).

Additionally, it's recommended to move the downloaded folder closer to the root directory to avoid errors caused by long file paths.

## Table of Contents
1. **Crafting the Page Layout**
    * [Creating horizontal/vertical layouts](/Chapter01/c1-HorizontalAndVerticalLayouts)
    * [Creating grid layouts](/Chapter01/c1-GridLayouts)
    * [Creating scrollable layouts](/Chapter01/c1-ScrollableLayout)
    * [Implementing device-specific layouts](/Chapter01/c1-DeviceSpecificLayout)
    * [Implementing layouts with dynamic orientation](/Chapter01/c1-OrientationSpecificSettings)
    * [Building a layout dynamically based on a collection](/Chapter01/c1-BindableLayout)
    * [Implementing a custom arranging algorithm](/Chapter01/c1-CustomLayout)
2. **Mastering the MVVM Design Pattern**
    * [Decoupling the UI from the view model](/Chapter02/c2-DecoupleViewAndViewModel)
    * [Implementing auto-generated view models](/Chapter02/c2-GeneratedViewModels)
    * [Implementing asynchronous commands](/Chapter02/c2-AsyncCommands)
    * [Initializing bound collections without freezing the UI](/Chapter02/c2-CollectionInitialization)
    * [Interacting with the UI from the view model without breaking MVVM](/Chapter02/c2-UiAndViewModelInteraction)
    * [Sending messages between view models via different channels](/Chapter02/c2-ViewModelCommunication)
    * [Injecting an application service into a view model using dependency injection](/Chapter02/c2-MvvmDependencyInjection)
    * [Troubleshooting binding errors](/Chapter02/c2-TroubleshootBindings)
3. **Advanced XAML and UI Techniques**
    * [Extending a UI element without subclassing using attached properties](/Chapter03/c3-AttachedProperties)
    * [Implementing attached behavior to reuse UI logic](/Chapter03/c3-AttachedBehavior)
    * [Implementing ContentView with dependency properties to reuse UI elements](/Chapter03/c3-ReusableContentView)
    * [Assigning custom animations to elements in XAML](/Chapter03/c3-CustomAnimations)
    * [Creating motion graphics with Lottie animations](/Chapter03/c3-LottieAnimations)
    * [Implementing dark/light theme switching](/Chapter03/c3-DarkAndLightThemes)
    * [Implementing theme support for images and the status bar](/Chapter03/c3-ThemedImagesAndStatusBar)
    * [Drawing custom elements on a canvas](/Chapter03/c3-CustomDrawing)
4. **Connect to a Database and Implement CRUD Operations**
    * [Connecting to a local SQLite database via Entity Framework Core](/Chapter04/c4-LocalDatabaseConnection)
    * [Implementing create and delete operations](/Chapter04/c4-CreateDelete)
    * [Implementing detail and edit forms](/Chapter04/c4-ItemEditing)
    * [Implementing the unit of work and repository patterns](/Chapter04/c4-UnitOfWork)
    * [Handling errors while saving data to a database](/Chapter04/c4-DatabaseValidation)
    * [Validating editors in the UI before data posting](/Chapter04/c4-UIValidation)
    * [Implementing data caching for enhanced performance](/Chapter04/c4-DataCaching)
    * [Connecting to a remote Web API service](/Chapter04/c4-WebApiComplete)
5. **Authentication & Authorization**
    * [Creating an authentication service with ASP.NET Core Identity](/Chapter05/c5-AuthenticationService)
    * [Building a client application connected to the authentication service](/Chapter05/c5-AuthenticationServiceAndClient)
    * [Implementing role-based access rules on the server](/Chapter05/c5-RoleBasedAccessPart1)
    * [Accessing endpoints with role-based access in the client application](/Chapter05/c5-RoleBasedAccessPart2)
    * [Signing in with a Google account](/Chapter05/c5-GoogleAuth)
    * [Managing secured sessions](/Chapter05/c5-SessionManagement)
    * [Implementing biometric authentication](/Chapter05/c5-BiometricAuth)
6. **Real-Life Scenarios: AI, SignalR, and More**
    * [Creating an AI assistant that enhances text with OpenAI](/Chapter06/c6-OpenAITextAssistant)
    * [Building a chat bot with Ollama deployed to a self-hosted server](/Chapter06/c6-DeployedAiAssistant)
    * [Detecting a face on an image with a local ONNX model deployed to the device](/Chapter06/c6-AIFaceDetection)
    * [Sending real-time updates from the server using SignalR](/Chapter06/c6-SignalRConnection)
    * [Uploading large files in chunks to a server](/Chapter06/c6-FileUploading)
    * [Sending local push notifications](/Chapter06/c6-LocalNotifications)
    * [Synchronizing data between the offline and online databases](/Chapter06/c6-OfflineDataSync)
7. **Understanding Platform-Specific APIs and Custom Handlers**
    * [Compiling code based on the target platform](/Chapter07/c7-ConditionalCompilation)
    * [Implementing a cross-platform API](/Chapter07/c7-PlatformViewCustomization)
    * [Customizing a platform view with an existing control handler](/Chapter07/)
    * [Creating a custom handler](/Chapter07/c7-DerivedHandler)
8. **Optimizing Performance**
    * [Comparing performance in debug and release configurations](/Chapter08/c8-DebugVsRelease)
    * [Simplifying a collection item template](/Chapter08/c8-SimplifiedItemTemplate)
    * [Using images with an optimal size](/Chapter08/c8-OptimizedImages)
    * [Using compiled bindings](/Chapter08/c8-CompiledBindings)
    * [Loading data in asynchronous methods](/Chapter08/c8-AsyncLoading)
    * [Profiling the application](/Chapter08/c8-PerformanceProfiling)
    * [Detecting memory leaks](/Chapter08/c8-TypicalMemoryLeaks)
    * [Getting rid of memory leaks](/Chapter08/c8-TypicalMemoryLeaks)

## Book Description
Think about how much time you usually spend building an app in a technology you're still mastering. It often involves grasping new concepts, navigating roadblocks, and even rewriting entire modules as your understanding deepens. This book is designed to save you that time, guiding you toward creating a modern .NET MAUI application with expert-level quality.
It addresses a wide range of essential tasks and concepts needed for real-world apps, including UI best practices and advanced tips, MVVM, dependency injection, performance and memory profiling. Since real applications often go beyond frontend development, this book also explores integration with backend services for authentication, data processing, synchronization, and real-time updates. Additionally, you’ll learn to implement multiple AI integration strategies - no prior machine learning experience required.

Mastery comes with practice, so the book is organized with step-by-step recipes, each tackling a specific task. Each recipe includes detailed explanations to help you apply the knowledge to your own unique projects.

By the end, you'll have the skills to build high-performance, interactive cross-platform applications with .NET MAUI - saving valuable time on your next projects.

## What You Will Learn
* Discover effective techniques for creating robust, adaptive layouts
* Leverage MVVM, DI, cached repository and unit of work patterns
* Implement CRUD forms with validation, local and remote databases
* Integrate authentication with a self-hosted service and Google OAuth
* Incorporate session management and role-based data access
* Tackle real-time updates, chunked file uploads and offline data mode
* Explore AI integration strategies: from local device to cloud models
* Master techniques to empower your app with platform-specific APIs
* Identify and eliminate performance and memory issues

## Who This Book Is For
This book is primarily aimed at developers who are already familiar with the basics of .NET MAUI. Whether you're actively building a .NET MAUI app or just starting to plan one, this guide will help you develop more efficiently and with better quality. Inside, you'll discover advanced techniques and practical examples to enhance your skills and tackle real-world development challenges. 

While a basic understanding of .NET MAUI and XAML is assumed, the recipes are presented in a simple, step-by-step format, making them easy to follow, even without prior experience. The only requirement is having your development environment set up, including Visual Studio or VS Code, .NET MAUI workloads, and an emulator or device for debugging.

![Book Cover](/Images/Book%20Cover.png)
