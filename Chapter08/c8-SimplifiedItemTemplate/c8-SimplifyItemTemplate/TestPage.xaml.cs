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
            items.Add(new Item(i,
                $"Item{i}",
                $"Value1_{i}",
                $"Value2_{i}",
                $"Value3_{i}",
                $"Value4_{i}"));
        }
        collectionView.ItemsSource = items;
    }
}
    public class Item(int id,
        string name,
        string prop1,
        string prop2,
        string prop3,
        string prop4)
    {
        public int Id { get; set; } = id;
        public string Name { get; set; } = name;
        public string Prop1 { get; set; } = prop1;
        public string Prop2 { get; set; } = prop2;
        public string Prop3 { get; set; } = prop3;
        public string Prop4 { get; set; } = prop4;
    }