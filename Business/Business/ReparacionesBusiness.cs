using Business.Data_Transfer_Objects;
using Business.Interfaces;
using DataAccess.Interfaces;
using Model.Enums;
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
        private readonly ISucursalDao _sucursalDao;
        public ReparacionesBusiness(IReparacionesDao reparacionesDao, ISucursalDao sucursalDao)
        {
            _reparacionesDao = reparacionesDao;
            _sucursalDao = sucursalDao;
        }

        public IList<Reparaciones> GetAllReparaciones()
        {
            return _reparacionesDao.GetAll();
        }

        public async Task<IList<Reparaciones>> GetReparacionesCondicion(FiltrosDto filtro)
        {
            var list = await _reparacionesDao.GetFiltrados(filtro.Estado, filtro.Sucursal, filtro.Producto);
            return list;
        }
        public Reparaciones GetReparacion(int id)
        {
            return _reparacionesDao.GetBy(id);
        }
        public bool Guardar(Reparaciones reparaciones)
        {
            int result = 0;
            if (reparaciones.Id == null)
            {
                result = _reparacionesDao.Insert(reparaciones);
            }
            else
            {
                result = _reparacionesDao.Update(reparaciones, reparaciones.Id);
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

        public bool Borrar(int id)
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
