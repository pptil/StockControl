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
    public class ReparacionesBusiness:IReparacionesBusiness
    {
        private readonly IReparacionesDao _reparacionesDao;
        public ReparacionesBusiness(IReparacionesDao reparacionesDao)
        {
            _reparacionesDao = reparacionesDao;
        }

        public IList<Reparaciones> GetAllReparaciones()
        {
            return _reparacionesDao.GetAll();
        }
        public Reparaciones GetReparacion(int id)
        {
            return _reparacionesDao.GetBy(id);
        }

    }
}
