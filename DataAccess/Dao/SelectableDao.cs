using DataAccess.Context;
using DataAccess.Interfaces;
using Model.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Dao
{
    public class SelectableDao : ISelectableDao
    {
        public IList<T> GetAllSelectable<T>() where T : class, ISelectable
        {
            using (var db = new StockContext())
            {
                return db.Set<T>().AsNoTracking().ToList();
            }
        }
    }
}
