# Initializing bound collections without freezing the UI
This example compliments a corresponding recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.packtpub.com/en-IT/product/net-maui-cookbook-9781835464625)

**The recipe in the book covers the following topics:**
* How to asynchronously load data when a view is displayed using `EventToCommandBehavior` and an async command.
* Why a bound collection must implement `INotifyCollectionChanged` or be a `BindingList<T>` if you need to add/remove items.
* How to avoid performance issues when adding or removing a large number of items.
* Why calling an async method from a view model constructor to initialize a collection can lead to a deadlock.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.