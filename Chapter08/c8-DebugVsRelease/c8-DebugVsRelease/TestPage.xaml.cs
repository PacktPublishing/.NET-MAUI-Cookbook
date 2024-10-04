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
            items.Add(new Item(i, $"Item{i}"));
        }
        collectionView.ItemsSource = items;
    }
}
    public class Item(int id, string name)
    {
        public int Id { get; set; } = id;
        public string Name { get; set; } = name;
    }