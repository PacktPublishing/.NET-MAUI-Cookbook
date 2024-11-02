using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c5_AuthenticationClient
{
    public partial class MainViewModel : ObservableObject
    {
        WebService webService = WebService.Instance;

        [ObservableProperty]
        string email;
        [ObservableProperty]
        string password;
        [RelayCommand]
        async Task LogInAsync()
        {
            try
            {
                BearerTokenInfo tokenInfo = await webService.Authenticate(Email, Password);
                await Shell.Current.DisplayAlert("Token", tokenInfo.AccessToken, "OK");
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", ex.Message, "OK");
            }
        }
    }
}
