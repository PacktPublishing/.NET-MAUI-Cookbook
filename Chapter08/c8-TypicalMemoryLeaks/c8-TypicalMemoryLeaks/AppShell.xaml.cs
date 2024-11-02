﻿using TypicalMemoryLeaks.Pages;

namespace TypicalMemoryLeaks {
    public partial class AppShell : Shell {
        public AppShell() {
            InitializeComponent();
            Routing.RegisterRoute(nameof(ControlLeakPage), typeof(ControlLeakPage));
            Routing.RegisterRoute(nameof(DelegateLeakPage), typeof(DelegateLeakPage));
            Routing.RegisterRoute(nameof(EventLeakPage), typeof(EventLeakPage));
            Routing.RegisterRoute(nameof(SingletonPage), typeof(SingletonPage));
            Routing.RegisterRoute(nameof(DirectReferenceLeakPage), typeof(DirectReferenceLeakPage));
        }
    }
}
