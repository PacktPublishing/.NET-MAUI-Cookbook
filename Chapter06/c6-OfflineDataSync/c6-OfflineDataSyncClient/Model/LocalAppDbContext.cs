using c6_OfflineDataSyncClient.Model;
using CommunityToolkit.Datasync.Client.Http;
using CommunityToolkit.Datasync.Client.Offline;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c6_OfflineDataSyncClient.Model
{
    public class LocalAppDbContext : OfflineDbContext
    {
        public DbSet<Blog> Blogs => Set<Blog>();

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "local2.db");
            optionsBuilder.UseSqlite($"Filename={dbPath}");
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnDatasyncInitialization(DatasyncOfflineOptionsBuilder optionsBuilder)
        {
            HttpClientOptions clientOptions = new()
            {
                Endpoint = new Uri("[YOUR DEV TUNNEL ADDRESS]/"),
            };
            _ = optionsBuilder.UseHttpClientOptions(clientOptions);
        }

        public async Task SynchronizeAsync(CancellationToken cancellationToken = default)
        {
            PushResult pushResult = await this.PushAsync(cancellationToken);
            if (!pushResult.IsSuccessful)
            {
                throw new ApplicationException($"Push failed: {pushResult.FailedRequests.FirstOrDefault().Value.ReasonPhrase}");
            }

            PullResult pullResult = await this.PullAsync(cancellationToken);
            if (!pullResult.IsSuccessful)
            {
                throw new ApplicationException($"Pull failed: {pullResult.FailedRequests.FirstOrDefault().Value.ReasonPhrase}");
            }
        }
    }
}
