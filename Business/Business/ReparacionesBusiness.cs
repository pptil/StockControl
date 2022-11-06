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
        public async Task<bool> Guardar(Reparaciones reparaciones)
        {
            int result = 0;
            if (reparaciones.reparacion_cod == null)
            {
                result = _reparacionesDao.Insert(reparaciones);
            }
            else
            {
                result = _reparacionesDao.Update(reparaciones, reparaciones.reparacion_cod);
            }

            if (result == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task<bool> Borrar(int id)
        {
            var ok =  _reparacionesDao.Delete(id);
            if(ok == 1)
            {
                return true;
            }
            else
            {
                return false;    
            }
        }


    }
}
