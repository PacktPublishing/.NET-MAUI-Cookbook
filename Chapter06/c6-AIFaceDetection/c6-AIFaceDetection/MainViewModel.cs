using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.ML;
using SkiaSharp;
using static Microsoft.ML.Transforms.Image.ImageResizingEstimator;
using Microsoft.ML.Data;

namespace c6_AIFaceDetection
{
    public partial class MainViewModel : ObservableObject
    {
        MLContext mlContext = new MLContext();
        ITransformer mlModel;
        readonly string sourceImageName = "test_image.jpg";
        readonly string modelName = "version-RFB-320.onnx";
        string sourceImagePath;

        [ObservableProperty]
        ImageSource? sourceImage;

        [ObservableProperty]
        ImageSource? faceImage;

        [RelayCommand]
        async Task InitializeAsync()
        {
            sourceImagePath = await FileOperations.CopyToAppData(sourceImageName);
            string onnxModelPath = await FileOperations.CopyToAppData(modelName);

            SourceImage = ImageSource.FromFile(sourceImagePath);
            mlModel = LoadModel(onnxModelPath);
        }

        [RelayCommand]
        async Task FindFaceAsync()
        {
            await Task.Run(() =>
            {
                IDataView scoredData = GetScoredData(sourceImagePath);
                float[] boxes = scoredData.GetColumn<float[]>("boxes").First();
                float[] scores = scoredData.GetColumn<float[]>("scores").First();

                int scoreIndex = GetFaceBoxIndex(scores);
                int boxIndex = scoreIndex * 4;

                CropImage(sourceImagePath,
                    left: boxes[boxIndex],
                    top: boxes[boxIndex + 1],
                    right: boxes[boxIndex + 2],
                    bottom: boxes[boxIndex + 3]);
            });
        }
        IDataView GetScoredData(string imagePath)
        {
            IEnumerable<ImageNetData> images = new List<ImageNetData>() { new ImageNetData() { ImagePath = imagePath } };
            IDataView imageDataView = mlContext.Data.LoadFromEnumerable(images);
            return mlModel.Transform(imageDataView);
        }
        int GetFaceBoxIndex(float[] scores)
        {
            int objectScoreIndex;
            float maxScore = -1;
            int maxScoreIndex = 0;
            for (int i = 0; i < scores.Length / 2; i++)
            {
                objectScoreIndex = i * 2 + 1;
                if (scores[objectScoreIndex] > maxScore)
                {
                    maxScore = scores[objectScoreIndex];
                    maxScoreIndex = i;
                }
            }
            return maxScoreIndex;
        }
        void CropImage(string imagePath, float left, float top, float right, float bottom)
        {
            using var inputStream = File.OpenRead(imagePath);
            var originalBitmap = SKBitmap.Decode(inputStream);
            var croppedBitmap = CreateCroppedBitmap(
                originalBitmap,
                new SKRectI(
                    (int)(left * originalBitmap.Width),
                    (int)(top * originalBitmap.Height),
                    (int)(right * originalBitmap.Width),
                    (int)(bottom * originalBitmap.Height)));
            FaceImage = ImageSource.FromStream(() => BitmapToStream(croppedBitmap));
        }
        SKBitmap CreateCroppedBitmap(SKBitmap originalBitmap, SKRectI cropRect)
        {
            var croppedBitmap = new SKBitmap(cropRect.Width, cropRect.Height);
            using var canvas = new SKCanvas(croppedBitmap);
            canvas.DrawBitmap(originalBitmap, cropRect, new SKRectI(0, 0, cropRect.Width, cropRect.Height));
            return croppedBitmap;
        }
        Stream BitmapToStream(SKBitmap bitmap)
        {
            var memoryStream = new MemoryStream();
            bitmap.Encode(memoryStream, SKEncodedImageFormat.Jpeg, 30);
            memoryStream.Seek(0, SeekOrigin.Begin);
            return memoryStream;
        }
        ITransformer LoadModel(string modelLocation)
        {
            var data = mlContext.Data.LoadFromEnumerable(new List<ImageNetData>());
            return mlContext.Transforms.LoadImages(
                outputColumnName: "input", imageFolder: "",
                inputColumnName: nameof(ImageNetData.ImagePath))
                            .Append(mlContext.Transforms.ResizeImages(
                                outputColumnName: "input",
                                imageWidth: 320,
                                imageHeight: 240,
                                inputColumnName: "input",
                                resizing: ResizingKind.Fill))
                            .Append(mlContext.Transforms.ExtractPixels(outputColumnName: "input"))
                            .Append(mlContext.Transforms.CustomMapping<NoralizationData, NoralizationData>(
                                NoralizationData.MeanAndScaleNormalization,
                                contractName: null))
                            .Append(mlContext.Transforms.ApplyOnnxModel(
                                modelFile: modelLocation,
                                outputColumnNames: new[] { "scores", "boxes" },
                                inputColumnNames: new[] { "input" }))
                            .Fit(data);
        }
    }
}
