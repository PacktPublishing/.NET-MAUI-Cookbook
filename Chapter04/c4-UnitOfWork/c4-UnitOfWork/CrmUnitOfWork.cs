using c4_LocalDatabaseConnection.ViewModels;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace c4_LocalDatabaseConnection {

    public class UnitOfWork : IDisposable {
        CrmContext Context = new CrmContext();
        CrmRepository<Customer> courseRepository;
        public CrmRepository<Customer> CustomerRepository =>
            courseRepository ??= new CrmRepository<Customer>(Context);
        public void Save() {
            Context.SaveChanges();
        }
        public void Dispose() {
            Context.Dispose();
        }
    }
    public class CrmRepository<TEntity> where TEntity : class {
        CrmContext Context;
        DbSet<TEntity> DbSet;
        public CrmRepository(CrmContext context) {
            Context = context;
            DbSet = context.Set<TEntity>();
        }

        public IEnumerable<TEntity> Get(Expression<Func<TEntity, bool>> filter = null) {
            IQueryable<TEntity> query = DbSet;
            if (filter != null) {
                query = query.Where(filter);
            }
            return query.ToList();
        }

        public TEntity GetByID(object id) {
            return DbSet.Find(id);
        }

        public void Insert(TEntity entity) {
            DbSet.Add(entity);
        }

        public void Delete(object id) {
            TEntity entityToDelete = DbSet.Find(id);
            Delete(entityToDelete);
        }

        public void Update(TEntity entityToUpdate) {
            DbSet.Attach(entityToUpdate);
            Context.Entry(entityToUpdate).State = EntityState.Modified;
        }
    }
}

