using System.Diagnostics;

namespace c3_AttachedProperties
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }
    }
    public static class EntrySelection
    {
        public static readonly BindableProperty SelectAllOnFocusProperty =
            BindableProperty.CreateAttached("SelectAllOnFocus",
                typeof(bool),
                typeof(EntrySelection),
                false,
                propertyChanged: OnSelectAllOnFocusChanged);
        public static bool GetSelectAllOnFocus(BindableObject view) =>
                (bool)view.GetValue(SelectAllOnFocusProperty);
        public static void SetSelectAllOnFocus(BindableObject view, bool value) =>
                view.SetValue(SelectAllOnFocusProperty, value);

        public static void OnSelectAllOnFocusChanged(BindableObject obj, object oldValue, object newValue)
        {
            if (obj is Entry entry)
            {
                if ((bool)newValue)
                {
                    entry.Focused += EntryFocused;
                }
                else
                {
                    entry.Focused -= EntryFocused;
                }
            }
        }

        private static void EntryFocused(object? sender, FocusEventArgs e)
        {
            if (sender is Entry entry)
            {
                entry.Dispatcher.Dispatch(() =>
                {
                    //setting the curspor position and selection back and forth is required on Windows for the Entry to update its state
                    entry.CursorPosition = entry.Text.Length;
                    entry.SelectionLength = 0;

                    entry.CursorPosition = 0;
                    entry.SelectionLength = entry.Text == null ? 0 : entry.Text.Length;
                });
            }
        }

        private static void EntryUnfocused(object? sender, FocusEventArgs e)
        {
            //if (sender is Entry entry)
            //{
            //    entry.CursorPosition = entry.Text.Length - 1;
            //}
        }
    }
}
