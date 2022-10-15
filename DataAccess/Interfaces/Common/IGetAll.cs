using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IGetAll<T> where T : class
    {
        IList<T> GetAll(bool asNoTracking = false);
    }
}
