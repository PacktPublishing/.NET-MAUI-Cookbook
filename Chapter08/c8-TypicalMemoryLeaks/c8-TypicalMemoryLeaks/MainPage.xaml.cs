using TypicalMemoryLeaks.Pages;
using System.Linq;

namespace TypicalMemoryLeaks {
    public partial class MainPage : ContentPage {
        public MainPage() {
            InitializeComponent();
        }

        private async void GoToStaticReferenceLeakClick(object sender, EventArgs e) {
            await Shell.Current.GoToAsync(nameof(DirectReferenceLeakPage));
        }
        private async void GoToEventLeakClick(object sender, EventArgs e) {
            await Shell.Current.GoToAsync(nameof(EventLeakPage));
        }
        private async void GoToDelegateLeakClick(object sender, EventArgs e) {
            await Shell.Current.GoToAsync(nameof(DelegateLeakPage));
        }
        private async void GoToControlLeakLeakClick(object sender, EventArgs e) {
            await Shell.Current.GoToAsync(nameof(ControlLeakPage));
        }
        private async void GoToSingletonPageClick(object sender, EventArgs e) {
            await Shell.Current.GoToAsync(nameof(SinglegonPage));
        }

        private void GetSummaryClick(object sender, EventArgs e) {
            MemoryHelper.Clean();
            outputLabel.Text = MemoryHelper.GetSummary();
        }
    }
    public static class MemoryHelper {
        public static List<WeakReference> Objects = new List<WeakReference>();
        public static void Clean() {
			GC.Collect();
            GC.WaitForPendingFinalizers();
        }
        public static string GetSummary() {
            var lines = Objects
                .Where(o => o.IsAlive)
                .GroupBy(o => o.Target.GetType())
                .Select(group => $"{group.Key.Name}: {group.Count()}");
            var list = lines.ToList();
            var aliveObjectsSummary = string.Join("\n", lines);
            return string.IsNullOrEmpty(aliveObjectsSummary) ? "No Items" : aliveObjectsSummary;
        }
    }
}