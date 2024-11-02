# Detecting with a local ONNX model deployed on the device
This example is part of a recipe from the book published by [Packt](https://www.packtpub.com/en-us?utm_source=github):

[.NET MAUI Cookbook: Build a full-featured app swiftly with MVVM, CRUD, AI, authentication, real-time updates, and more](https://www.amazon.com/NET-MAUI-Cookbook-authentication-interactivity/dp/1835461123)

**In the book, this recipe covers:**
* Introduction to [ML.NET](https://learn.microsoft.com/en-us/dotnet/machine-learning/overview) and pretrained [ONNX](https://onnx.ai/) models, such as [UltraFace](https://github.com/onnx/models/tree/main/validated/vision/body_analysis/ultraface).
* Feeding a pretrained ONNX model using ML.NET.
* Exploring the UltraFace model structure.
* Building a pipeline to prepare input data in the format expected by the model.
* Normalizing data using the `CustomMapping` method in ML.NET.
* Processing the model’s output data.
* Cropping an image according to face boundaries detected by the UltraFace model.

**Note:** This example may not include all the points mentioned above. For complete details, please refer to the corresponding recipe in the book.

## Output
![Face Detection](/Images/Face%20Detection.png)
