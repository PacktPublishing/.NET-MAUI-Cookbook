using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;

namespace c8_AsyncLoading
{
    public partial class MainViewModel : ObservableObject
    {
        [ObservableProperty]
        string productName;

        [ObservableProperty]
        string description;

        [RelayCommand]
        async Task LoadDataAsync()
        {
            await Task.Delay(2000);
            ProductName = "Some product";
            Description = "Product description";
        }
    }
}
