using Business.Data_Transfer_Objects;
using Business.Interfaces;
using DataAccess.Dao;
using DataAccess.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Business
{
    public class VentasBusiness : IVentasBusiness
    {
        private readonly IVentasDao _VentasDao;
        public VentasBusiness(IVentasDao VentasDao)
        {
            _VentasDao = VentasDao;
        }

        public async Task<IList<Ventas>> GetAllVentas()
        {
            return await _VentasDao.GetAllVentas();
        }

        public async Task<List<Ventas>> GetVentasPorSucursal(int sucursal)
        {
            return await _VentasDao.GetVentasPorSucursal(sucursal);
        }

        public async Task<IList<Ventas>> GetArticulosCondicion(FiltrosDto filtro)
        {
            var list = await _VentasDao.GetFiltrados(filtro.Pedido, filtro.Sucursal, filtro.Proveedor, filtro.FechaDesde, filtro.FechaHasta);
            return list;
        }

        public Ventas GetByID(int id)
        {
            return _VentasDao.GetVenta(id);
        }

        public bool Borrar(int id)
        {
            var ok = _VentasDao.Delete(id);
            if (ok == 1)
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
