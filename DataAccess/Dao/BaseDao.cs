using DataAccess.Context;
using DataAccess.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Dao
{
    public class BaseDao<T> : IGetAll<T>, IGetBy<T>, IInsert<T>, IUpdate<T>, IDelete<T>, ISaveChanges
        where T : class
    {
        public DbSet<T> DbSet => new MusicaContext().Set<T>();

        public IList<T> GetAll(bool asNoTracking = false)
        {
            using (var db = new MusicaContext())
            {
                return asNoTracking ? db.Set<T>().AsNoTracking().ToList() : db.Set<T>().ToList();
            }
        }

        public T GetBy(object id)
        {
            using (var db = new MusicaContext())
            {
                return db.Set<T>().Find(id);
            }
        }

        public T GetByCondition(Expression<Func<T, bool>> filter)
        {
            using (var db = new MusicaContext())
            {
                return db.Set<T>().FirstOrDefault(filter);
            }
        }

        public async Task<T> GetByConditionAsync(Expression<Func<T, bool>> filter)
        {
            using (var db = new MusicaContext())
            {
                return await db.Set<T>().FirstOrDefaultAsync(filter);
            }
        }

        public async Task<IList<T>> GetManyByConditionAsync(Expression<Func<T, bool>> filter)
        {
            using (var db = new MusicaContext())
            {
                return await db.Set<T>().Where(filter).ToListAsync();
            }
        }

        public IEnumerable<T> GetBy<TKey>(Expression<Func<T, bool>> filter, Expression<Func<T, TKey>> order, int pageNumber = 0, int pageSize = 0, bool orderByDesc = false)
        {
            using (var db = new MusicaContext())
            {
                var query = db.Set<T>().Where(filter).AsQueryable();
                if (pageNumber > 0 && pageSize > 0)
                {
                    if (orderByDesc)
                        query = query.OrderByDescending(order).Skip((pageNumber - 1) * pageSize).Take(pageSize);
                    else
                        query = query.OrderBy(order).Skip((pageNumber - 1) * pageSize).Take(pageSize);
                    return query.ToList();
                }

                return new List<T>();
            }
        }

        public int Count(Expression<Func<T, bool>> filter)
        {
            using (var db = new MusicaContext())
            {
                return db.Set<T>().Where(filter).Count();
            }
        }

        public int Insert(T entity)
        {
            using (var db = new MusicaContext())
            {
                db.Set<T>().Add(entity);
                return db.SaveChanges();
            }
        }

        public async Task<bool> SaveChangesAsync()
        {
            using (var db = new MusicaContext())
            {
                return (await db.SaveChangesAsync()) > 0;
            }
        }

        public int Update<TId>(T entity, TId id)
        {
            using (var db = new MusicaContext())
            {
                var item = db.Set<T>().Find(id);
                db.Entry(item).CurrentValues.SetValues(entity);
                return db.SaveChanges();
            }
        }

        public async Task<int> UpdateAsync<TId>(T entity, TId id)
        {
            using (var db = new MusicaContext())
            {
                var item = await db.Set<T>().FindAsync(id);
                db.Entry(item).CurrentValues.SetValues(entity);
                return await db.SaveChangesAsync();
            }
        }

        public int Delete<TId>(TId id)
        {
            using (var db = new MusicaContext())
            {
                var entity = db.Set<T>().Find(id);
                if (entity != null)
                {
                    db.Set<T>().Remove(entity);
                    return db.SaveChanges();
                }
                return 0;
            }
        }

        public int Delete(Expression<Func<T, bool>> filter)
        {
            using (var db = new MusicaContext())
            {
                var entity = db.Set<T>().FirstOrDefault(filter);
                if (entity != null)
                {
                    db.Set<T>().Remove(entity);
                    return db.SaveChanges();
                }
                return 0;
            }
        }
    }
}

