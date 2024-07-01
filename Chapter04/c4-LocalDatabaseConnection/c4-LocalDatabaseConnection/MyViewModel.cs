using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace c4_LocalDatabaseConnection {
    public partial class MyViewModel : ObservableObject {
        [ObservableProperty]
        ObservableCollection<Customer> customers;

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(LoadCustomersCommand))]
        bool isDataLoaded;
        [RelayCommand(CanExecute = nameof(CanLoadCustomers))]
        async Task LoadCustomersAsync() {
            await Task.Run(() =>
            {
                using CrmContext context = new CrmContext();
                if (!context.Customers.Any()) {
                    PopulateCustomers(context);
                };
                Customers = new ObservableCollection<Customer>(context.Customers);
            });
            IsDataLoaded = true;
        }
        void PopulateCustomers(CrmContext context) {
            for (int i = 1; i < 10; i++) {
                context.Customers.Add(new Customer() {
                    Id = i,
                    Name = $"Customer {i}"
                });
            }
            context.SaveChanges();
        }
        bool CanLoadCustomers() => !IsDataLoaded;
    }

    public class CrmContext : DbContext {
        public DbSet<Customer> Customers { get; set; }
        public CrmContext() {
            SQLitePCL.Batteries_V2.Init();
            Database.EnsureCreated();
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) {
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "crm.db");
            optionsBuilder.UseSqlite($"Filename={dbPath}");
            base.OnConfiguring(optionsBuilder);
        }
    }

    public class Customer {
        public int Id {
            get;
            set;
        }

        public string Name {
            get;
            set;
        }
    }
}
