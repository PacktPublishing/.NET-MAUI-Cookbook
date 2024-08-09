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
        [ObservableProperty]
        ObservableCollection<User> users;

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(DeleteUserCommand))]
        bool allowDelete;

        [ObservableProperty]
        User loggedInUser;

        WebService service = WebService.Instance;

        [RelayCommand]
        async Task Initialize()
        {
            Users = new ObservableCollection<User>(await service.GetUsersAsync());
            AllowDelete = await service.CanDeleteUsersAsync();
            LoggedInUser = await service.GetCurrentUserAsync();
        }
        [RelayCommand(CanExecute = nameof(CanDeleteUser))]
        async Task DeleteUser(User user)
        {
            try
            {
                await service.DeleteUserAsync(user.Email);
                Users.Remove(user);
            }
            catch (Exception ex) {
                await Shell.Current.DisplayAlert("Error", ex.Message, "OK");
            }
        }
        bool CanDeleteUser() => AllowDelete;
    }
}
