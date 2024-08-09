using c5_AuthenticationClient.Model;
using c5_AuthenticationClient.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Diagnostics;
using System.Linq;
using System.Net;

namespace c5_AuthenticationClient
{
    public partial class MainViewModel : ObservableObject
    {
        WebService webService = WebService.Instance;
        SessionService sessionService = SessionService.Instance;

        [ObservableProperty]
        string email;
        [ObservableProperty]
        string password;
        [RelayCommand]
        async Task SessionLogInAsync()
        {
            if (await sessionService.UseExistingSession())
            {
                await Shell.Current.GoToAsync(nameof(UsersPage));
            }
        }
        [RelayCommand]
        async Task LogInAsync()
        {
            try
            {
                await webService.Authenticate(Email, Password);
                await Shell.Current.GoToAsync(nameof(UsersPage));
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", ex.Message, "OK");
            }
        }

        [RelayCommand]
        async Task GoogleSignInAsync()
        {
            try
            {
                await webService.GoogleAuthAsync();
                await Shell.Current.GoToAsync(nameof(UsersPage));
            }
            catch (Exception ex) when (!(ex is TaskCanceledException))
            {
                await Shell.Current.DisplayAlert("Sign in failed", ex.Message, "OK");
            }
        }
    }
}
