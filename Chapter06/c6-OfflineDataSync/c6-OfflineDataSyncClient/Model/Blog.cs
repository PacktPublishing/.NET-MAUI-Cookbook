using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c6_OfflineDataSyncClient.Model
{
    public class Blog : OfflineClientEntity
    {
        public string Title { get; set; } = string.Empty;
        [NotMapped]
        public bool InSync { get; set; } = true;
    }
}
