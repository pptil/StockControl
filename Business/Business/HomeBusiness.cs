using Business.Data_Transfer_Objects;
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
    public class HomeBusiness: IHomeBusiness
    {
        private readonly IArticulosDao _articulosDao;
        private readonly IReparacionesDao _reparacionesDao;
        private readonly IPedidosDao _pedidosDao;
        private readonly IVentasDao _ventasDao;

        public HomeBusiness(IArticulosDao articulosDao, IReparacionesDao reparacionesDao, IPedidosDao pedidosDao, IVentasDao ventasDao)
        {
            _articulosDao = articulosDao;
            _reparacionesDao = reparacionesDao;
            _ventasDao = ventasDao;
            _pedidosDao = pedidosDao;
        }
        public async Task<HomeDto> GetHome()
        {
            var reparacion = _reparacionesDao.GetAll();
            var pedido = await _pedidosDao.GetAllPedidos();
            var venta = await _ventasDao.GetAllVentas();
            var articulos = await _articulosDao.GetArticulosPorSucursal(1);

            return new HomeDto
            {
                Articulos = articulos != null? articulos.OrderByDescending(x => x.Id).Take(3).ToList(): new List<Articulos>(),
                Pedido = pedido !=null? pedido.OrderByDescending(x => x.Id).Take(1).FirstOrDefault():new Pedidos(),
                Reparacion = reparacion != null ? reparacion.OrderByDescending(x => x.Id).Take(1).FirstOrDefault():new Reparaciones(),
                Venta = venta != null ? venta.OrderByDescending(x => x.Id).Take(1).FirstOrDefault() : new Ventas(),
            };

        }
    }
}
