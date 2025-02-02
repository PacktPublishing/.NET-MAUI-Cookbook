﻿using c6_OfflineDataSyncClient.Model;

namespace c6_OfflineDataSyncClient
{
    public partial class App : Application
    {
        public App()
        {
            using var context = new LocalAppDbContext();
            SQLitePCL.Batteries_V2.Init();
            context.Database.EnsureCreated();

            InitializeComponent();

        }
        protected override Window CreateWindow(IActivationState activationState)
        {
            return new Window(new AppShell());
        }
    }
}
