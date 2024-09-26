using Microsoft.EntityFrameworkCore;

namespace c6_OfflineDataSyncServer
{
    public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
    {
        public DbSet<Blog> Blogs => Set<Blog>();
        public async Task InitializeDatabaseAsync()
        {
            await Database.EnsureCreatedAsync();
        }
    }
}
