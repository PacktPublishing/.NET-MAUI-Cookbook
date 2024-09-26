using Microsoft.Maui.Handlers;

namespace с7_CustomizeExistingHandler
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
        public CustomEntryHandler() : base(PropertyMapper, CommandMapper)
        {
        }

        // Mapper that connects the SelectionColor property to each platform
        public static IPropertyMapper<CustomEntry, CustomEntryHandler> PropertyMapper = new PropertyMapper<CustomEntry, CustomEntryHandler>(EntryHandler.Mapper)
        {
            [nameof(CustomEntry.SelectionColor)] = MapSelectionColor
        };

        //public static CommandMapper<CustomEntry, CustomEntryHandler> CommandMapper = new(EntryHandler.CommandMapper);

        // Map SelectionColor to platform-specific views
        static partial void MapSelectionColor(CustomEntryHandler handler, CustomEntry entry);
        //        {
        //#if ANDROID
        //            handler.PlatformView?.SetHighlightColor(entry.SelectionColor.ToAndroid());
        //#elif IOS
        //            if (handler.PlatformView != null)
        //            {
        //                handler.PlatformView.TintColor = entry.SelectionColor.ToUIColor();
        //            }
        //#elif WINDOWS
        //            if (handler.PlatformView != null)
        //            {
        //                var color = new SolidColorBrush(entry.SelectionColor.ToWindowsColor());
        //                handler.PlatformView.SelectionHighlightColor = color;
        //            }
        //#endif
        //        }
        // Override to connect to the platform view and handle any custom logic if needed
        //protected override void ConnectHandler(object platformView)
        //{
        //    base.ConnectHandler(platformView);
        //    UpdateSelectionColor();
        //}

        // Helper method to update the selection color based on the platform
        private void UpdateSelectionColor()
        {
            if (VirtualView is CustomEntry customEntry)
            {
                MapSelectionColor(this, customEntry);
            }
        }
    }
    //public static class ColorExtensions
    //{
    //    public static Color ToAndroid(this Microsoft.Maui.Graphics.Color color)
    //    {
    //        return new Color((byte)(color.Red * 255), (byte)(color.Green * 255), (byte)(color.Blue * 255), (byte)(color.Alpha * 255));
    //    }
    //}
}
