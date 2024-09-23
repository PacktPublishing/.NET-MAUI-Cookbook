using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c6_OfflineDataSyncClient.Model
{
    public abstract class OfflineClientEntity
    {
        [Key]
        public string Id { get; set; } = Guid.NewGuid().ToString("N");
        public DateTimeOffset? UpdatedAt { get; set; }
        public string? Version { get; set; }
        public bool Deleted { get; set; }
    }
}
