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
        public DbSet<TodoItem> TodoItems => Set<TodoItem>();

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "local.db");
            optionsBuilder.UseSqlite($"Filename={dbPath}");
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnDatasyncInitialization(DatasyncOfflineOptionsBuilder optionsBuilder)
        {
            HttpClientOptions clientOptions = new()
            {
                Endpoint = new Uri("https://zz4kwzzx-53791.asse.devtunnels.ms/"),
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
