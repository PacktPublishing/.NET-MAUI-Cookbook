using System.Collections.ObjectModel;

namespace c8_DebugVsRelease;

public partial class TestPage : LoadingTimePage
{
    public TestPage()
    {
        InitializeComponent();

        ObservableCollection<Item> items = new ObservableCollection<Item>();
        for (int i = 1; i < 30; i++)
        {
            items.Add(new Item(ImageSource.FromFile(Path.Combine(FileSystem.Current.AppDataDirectory, "test.png"))));
        }
        collectionView.ItemsSource = items;
    }
    public class Item(ImageSource icon)
    {
        public ImageSource Icon { get; set; } = icon;
    }
}