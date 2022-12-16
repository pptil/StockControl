using Business.Data_Transfer_Objects;
using Business.Interfaces;
using DataAccess.Interfaces;
using Model.Enums;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Threading.Tasks;

namespace Business.Business
{
    public class ReparacionesBusiness:IReparacionesBusiness
    {
        private readonly IReparacionesDao _reparacionesDao;
        private readonly ISucursalDao _sucursalDao;
        static readonly string sucursal = ConfigurationManager.AppSettings["Sucursal"];
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
            bool result =false;
            if (reparaciones.Id == null)
            {
                reparaciones.FechaAlta = DateTime.Now;
                reparaciones.Sucursal = Convert.ToInt16(sucursal);
                result = _reparacionesDao.Insert(reparaciones) > 0;
            }
            else
            {
                result = _reparacionesDao.Update(reparaciones, reparaciones.Id) > 0;
            }
            return result;
        }

        public bool Borrar(int id)
        {
            return _reparacionesDao.Delete(id) > 0;           
        }
    }
}
