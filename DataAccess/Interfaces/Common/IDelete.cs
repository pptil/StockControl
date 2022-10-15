using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IDelete<T> where T : class
    {
        int Delete<TId>(TId id);
        int Delete(Expression<Func<T, bool>> filter);
    }
}
