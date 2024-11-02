using CommunityToolkit.Mvvm.Messaging;

namespace c2_DecoupleViewAndViewModel {
    public partial class MainPage : ContentPage {
        public MainPage() {
            InitializeComponent();
            WeakReferenceMessenger.Default.Register<Customer>(this, (r, customer) =>
            {
                customersCollectionView.ScrollTo(customer);
            });
        }
    }

}
