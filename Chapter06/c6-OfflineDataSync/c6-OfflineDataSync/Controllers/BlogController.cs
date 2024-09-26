using CommunityToolkit.Datasync.Server.EntityFrameworkCore;
using CommunityToolkit.Datasync.Server;

using Microsoft.AspNetCore.Mvc;

namespace c6_OfflineDataSyncServer.Controllers
{
    [Route("tables/[controller]")]
    public class BlogController (AppDbContext context) : TableController<Blog>(new EntityTableRepository<Blog>(context))
    {

    }
}
