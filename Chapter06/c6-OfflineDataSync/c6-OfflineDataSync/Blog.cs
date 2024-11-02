using CommunityToolkit.Datasync.Server.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace c6_OfflineDataSyncServer
{
    public class Blog : EntityTableData
    {
        [Required, MinLength(1)]
        public string Title { get; set; } = string.Empty;
    }
}
