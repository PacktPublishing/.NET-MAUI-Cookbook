using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using OpenAI.Chat;
using System.ClientModel;

namespace c6_OpenAITextAssistant
{
    public partial class MainViewModel : ObservableObject
    {
        [ObservableProperty]
        string letterText;

        ChatClient aiClient = new(model: "gpt-3.5-turbo", "[Your API Key]");

        [RelayCommand]
        async Task FixErrorsAsync()
        {
            try
            {
                AsyncCollectionResult<StreamingChatCompletionUpdate> updates = aiClient.CompleteChatStreamingAsync(
                        new SystemChatMessage($"You are an assistant correcting text"),
                        new UserChatMessage($"Fix grammar errors in the following text: {LetterText}"));

                LetterText = null;
                await foreach (StreamingChatCompletionUpdate update in updates)
                {
                    foreach (ChatMessageContentPart updatePart in update.ContentUpdate)
                    {
                        LetterText +=updatePart.Text;
                    }
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", ex.Message, "OK");
            }
        }
    }
}
