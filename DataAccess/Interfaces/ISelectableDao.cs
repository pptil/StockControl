using Model.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface ISelectableDao
    {
        IList<T> GetAllSelectable<T>() where T : class, ISelectable;
    }
}
