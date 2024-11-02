using Microsoft.EntityFrameworkCore;
using SharedModel;

namespace CrmWebApi {
    public class CrmContext : DbContext {
        public DbSet<Customer> Customers { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) {
            optionsBuilder.UseSqlite("Data Source=localdatabase.db");
            base.OnConfiguring(optionsBuilder);
        }
        protected override void OnModelCreating(ModelBuilder builder) {
            builder.Entity<Customer>()
                .HasIndex(c => c.Email)
                .IsUnique();
            builder.Entity<Customer>()
                .Property(c => c.FirstName)
                .IsRequired();

            builder.Entity<Customer>().HasData(new Customer {
                Id = 1,
                FirstName = "John",
                LastName = "Doe",
                Email = "john.doe@cookbook.com"
            });
        }
    }
}
