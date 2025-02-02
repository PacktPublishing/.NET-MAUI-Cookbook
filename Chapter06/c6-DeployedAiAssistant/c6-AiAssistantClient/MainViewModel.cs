using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Text.Json;

namespace c6_AiAssistantClient
{
    public partial class MainViewModel : ObservableObject
    {
        HttpClient httpClient = new HttpClient()
        {
            BaseAddress = new Uri("[Your Dev Tunnel Address]/"),
            Timeout = TimeSpan.FromSeconds(30)
        };

        [NotifyCanExecuteChangedFor(nameof(SendMessageCommand))]
        [ObservableProperty]
        string? message;

        [ObservableProperty]
        string? answer;

        [RelayCommand (CanExecute = nameof(CanSendMessage))]
        async Task SendMessageAsync()
        {
            var response = await httpClient.GetAsync($"ask-question?question='{Uri.EscapeDataString(Message)}'");
            response.EnsureSuccessStatusCode();
            Answer = await response.Content.ReadAsStringAsync();
            Message = null;
        }
        bool CanSendMessage()
            => !string.IsNullOrEmpty(Message);
    }
}
