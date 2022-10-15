using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IGetBy<T> where T : class
    {
        T GetBy(object id);
        T GetByCondition(Expression<Func<T, bool>> filter);
        Task<T> GetByConditionAsync(Expression<Func<T, bool>> filter);
        Task<IList<T>> GetManyByConditionAsync(Expression<Func<T, bool>> filter);
        IEnumerable<T> GetBy<TKey>(Expression<Func<T, bool>> filter, Expression<Func<T, TKey>> order, int pageNumber = 0, int pageSize = 0, bool orderByDesc = false);
        int Count(Expression<Func<T, bool>> filter);
    }
}
