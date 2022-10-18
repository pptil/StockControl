using Business.Interfaces;
using DataAccess.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Business
{
    public class ProveedoresBusiness : IProveedoresBusiness
    {
        private readonly IProveedoresDao _proveedoresDao;
        public ProveedoresBusiness(IProveedoresDao proveedoresDao)
        {
            _proveedoresDao = proveedoresDao;
        }
        

        public IList<Proveedores> GetAllProveedores()
        {
            return _proveedoresDao.GetAll();
        }
    }
}
