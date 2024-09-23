using c6_OfflineDataSync.Db;
using Microsoft.AspNetCore.Datasync;
using Microsoft.AspNetCore.Datasync.EFCore;
using Microsoft.AspNetCore.Mvc;

namespace c6_OfflineDataSync.Controllers
{
    [Route("tables/todoitem")]
    public class TodoItemController : TableController<TodoItem>
    {
        public TodoItemController(AppDbContext context)
            : base(new EntityTableRepository<TodoItem>(context))
        {
        }
    }
}