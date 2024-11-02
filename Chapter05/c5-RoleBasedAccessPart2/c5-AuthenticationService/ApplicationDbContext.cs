using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Emit;

namespace c5_AuthenticationService
{
    public class ApplicationDbContext : IdentityDbContext<User>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }
        //protected override void OnModelCreating(ModelBuilder builder)S
        //{
        //    base.OnModelCreating(builder);
        //    builder.Entity<User>().Property(u => u.Initials).HasMaxLength(5);
        //    builder.HasDefaultSchema("identity");
        //}
    }
}
