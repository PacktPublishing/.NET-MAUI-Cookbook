using c5_AuthenticationClient.Model;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c5_AuthenticationClient.ViewModels
{
    public partial class UsersViewModel : ObservableObject
    {
        WebService webService = WebService.Instance;
        SessionService sessionService = SessionService.Instance;

        [ObservableProperty]
        ObservableCollection<User> users;

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(DeleteUserCommand))]
        bool allowDelete;

        [ObservableProperty]
        User loggedInUser;

        [RelayCommand]
        async Task Initialize()
        {
            Users = new ObservableCollection<User>(await webService.GetUsersAsync());
            AllowDelete = await webService.CanDeleteUsersAsync();
            LoggedInUser = await webService.GetCurrentUserAsync();
        }

        [RelayCommand]
        async Task LogOut()
        {
            sessionService.ClearTokenStorage();
            webService.ResetAuthHeader();
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand(CanExecute = nameof(CanDeleteUser))]
        async Task DeleteUser(User user)
        {
            try
            {
                await webService.DeleteUserAsync(user.Email);
                Users.Remove(user);
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", ex.Message, "OK");
            }
        }
        bool CanDeleteUser() => AllowDelete;
    }
}
