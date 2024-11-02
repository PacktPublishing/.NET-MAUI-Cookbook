using Microsoft.Maui.Storage;
using SkiaSharp;

namespace c8_DebugVsRelease
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        async void OnOpenTestPageClicked(object sender, EventArgs e)
        {
            LoadingTimePage.StartTimer();
            await Shell.Current.GoToAsync(nameof(TestPage), false);
        }

        async void OnSelectImageClick(object sender, EventArgs e)
        {
            PickOptions options = new()
            {
                PickerTitle = "Select an image",
                FileTypes = FilePickerFileType.Images
            };
            var result = await FilePicker.Default.PickAsync(options);
            if (result != null)
            {
                var imageStream = await result.OpenReadAsync();
                imageStream = ResizeImage(imageStream, 40, 40);
                imageControl.Source = ImageSource.FromStream(() => imageStream);

                using FileStream fileStream = File.Create(Path.Combine(FileSystem.Current.AppDataDirectory, "test.png"));
                await imageStream.CopyToAsync(fileStream);
                imageStream.Seek(0, SeekOrigin.Begin);
            }
        }

        public Stream ResizeImage(Stream inputStream, int width, int height)
        {
            using var originalBitmap = SKBitmap.Decode(inputStream);

            using var resizedBitmap = new SKBitmap(width, height);
            using var canvas = new SKCanvas(resizedBitmap);
            canvas.Clear(SKColors.Transparent);

            var scale = Math.Min((float)width / originalBitmap.Width, (float)height / originalBitmap.Height);
            var destRect = new SKRect(0, 0, originalBitmap.Width * scale, originalBitmap.Height * scale);
            canvas.DrawBitmap(originalBitmap, destRect);

            var outputStream = new MemoryStream();
            resizedBitmap.Encode(outputStream, SKEncodedImageFormat.Png, 100);
            outputStream.Seek(0, SeekOrigin.Begin);

            return outputStream;
        }
    }

}
