using CommunityToolkit.Maui;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls;
using System.Net.Http;

namespace c2_DecoupleViewAndViewModel {
    public static class MauiProgram {
        public static MauiApp CreateMauiApp() {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .RegisterViewModels()
                .RegisterViews()
                .RegisterAppServices()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
        public static MauiAppBuilder RegisterViewModels(this MauiAppBuilder mauiAppBuilder) {
            mauiAppBuilder.Services.AddTransient<MyViewModel>();
            return mauiAppBuilder;
        }
        public static MauiAppBuilder RegisterViews(this MauiAppBuilder mauiAppBuilder) {
            mauiAppBuilder.Services.AddTransient<MainPage>();
            return mauiAppBuilder;
        }
        public static MauiAppBuilder RegisterAppServices(this MauiAppBuilder mauiAppBuilder) {
            mauiAppBuilder.Services.AddSingleton<IDummyService, DummyService>();
            return mauiAppBuilder;
        }
    }
    public class DISource : IMarkupExtension {
        public Type Type { get; set; }
        public object ProvideValue(IServiceProvider serviceProvider) {
            return Application.Current.MainPage.Handler.MauiContext.Services.GetService(Type);
        }
    }
}
