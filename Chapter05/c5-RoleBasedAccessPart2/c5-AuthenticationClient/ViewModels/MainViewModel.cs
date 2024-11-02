using c5_AuthenticationClient.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Linq;

namespace c5_AuthenticationClient
{
    public partial class MainViewModel : ObservableObject
    {
        [ObservableProperty]
        string email;
        [ObservableProperty]
        string password;
        [RelayCommand]
        async Task LogInAsync()
        {
            try
            {
                BearerTokenInfo tokenInfo = await WebService.Instance.Authenticate(Email, Password);
                await Shell.Current.GoToAsync(nameof(UsersPage));
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", ex.Message, "OK");
            }
        }
    }
}
