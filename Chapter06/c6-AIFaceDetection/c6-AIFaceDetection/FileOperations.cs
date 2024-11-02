namespace c6_AIFaceDetection
{
    public static class FileOperations
    {
        public static async Task<string> CopyToAppData(string assetFileName)
        {
            string targetFile = Path.Combine(FileSystem.Current.AppDataDirectory, assetFileName);
            if (File.Exists(targetFile))
                return targetFile;
            using Stream inputStream = await FileSystem.Current.OpenAppPackageFileAsync(assetFileName);
            using FileStream outputStream = File.Create(targetFile);
            await inputStream.CopyToAsync(outputStream);
            return targetFile;
        }
    }
}
