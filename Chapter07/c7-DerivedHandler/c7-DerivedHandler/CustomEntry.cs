using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Maui.Handlers;
using System.Diagnostics.CodeAnalysis;

namespace c7_DerivedHandler
{
    public class CustomEntry : Entry
    {
        public static readonly BindableProperty SelectionColorProperty = BindableProperty.Create(
            nameof(SelectionColor),
            typeof(Color),
            typeof(CustomEntry),
            Colors.Gray);

        public Color SelectionColor
        {
            get => (Color)GetValue(SelectionColorProperty);
            set => SetValue(SelectionColorProperty, value);
        }
    }

    public partial class CustomEntryHandler : EntryHandler
    {
        public CustomEntryHandler() : base(PropertyMapper, CommandMapper) { }

        public static IPropertyMapper<CustomEntry, CustomEntryHandler> PropertyMapper = new PropertyMapper<CustomEntry, CustomEntryHandler>(EntryHandler.Mapper)
        {
            [nameof(CustomEntry.SelectionColor)] = MapSelectionColor
        };

        static partial void MapSelectionColor(CustomEntryHandler handler, CustomEntry entry);
    }
    public static class CustomBuilderExtensions
    {
        public static MauiAppBuilder UseCustomEntry(this MauiAppBuilder builder)
        {
            builder.ConfigureMauiHandlers(handlers =>
            {
                handlers.AddHandler<CustomEntry, CustomEntryHandler>();
            });
            return builder;
        }
    }
}
