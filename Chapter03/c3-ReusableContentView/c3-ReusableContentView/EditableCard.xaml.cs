namespace c3_ReusableContentView;

public partial class EditableCard : ContentView {
    public string Text {
        get { return (string)GetValue(TextProperty); }
        set { SetValue(TextProperty, value); }
    }
    public static readonly BindableProperty TextProperty = BindableProperty.Create("Text", typeof(string), typeof(EditableCard));

    public EditableCard() {
        InitializeComponent();
        BindingContext = this;
    }
    bool isEditing;
    private void OnEditButtonClicked(object sender, EventArgs e) {
        isEditing = !isEditing;
        if (isEditing) {
            editor.IsReadOnly = false;
            editor.Focus();
            editor.CursorPosition = editor.Text == null ? 0 : editor.Text.Length;
            editButton.Text = "Save";
        }
        else {
            editor.IsReadOnly = true;
            editButton.Focus();
            editButton.Text = "Edit";
        }
    }

}