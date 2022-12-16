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
        private readonly IVentasDao _ventasDao;
        public VentasBusiness(IVentasDao VentasDao)
        {
            _ventasDao = VentasDao;
        }

        public async Task<IList<Ventas>> GetAllVentas()
        {
            return await _ventasDao.GetAllVentas();
        }

        public async Task<List<Ventas>> GetVentasPorSucursal(int sucursal)
        {
            return await _ventasDao.GetVentasPorSucursal(sucursal);
        }

        public async Task<IList<Ventas>> GetArticulosCondicion(FiltrosDto filtro)
        {
            var list = await _ventasDao.GetFiltrados(filtro.Pedido, filtro.Sucursal, filtro.Proveedor, filtro.FechaDesde, filtro.FechaHasta);
            return list;
        }

        public Ventas GetByID(int id)
        {
            return _ventasDao.GetVenta(id);
        }

        public async Task<bool> Guardar(int id, DateTime? fecha, PedidosDto[] ventaDto)
        {

                if (id == 0)
                {
                    var venta = MapVentas(null, fecha, ventaDto);
                    venta.FechaAlta = DateTime.Now;
                    return _ventasDao.Insert(venta) > 0;
                }
                else
                {
                    var venta = MapVentas(id, fecha, ventaDto);
                    venta.Id = id;
                    await _ventasDao.SaveChangesAsync();
                    return _ventasDao.Actualizar(venta);
                }

        }

        public bool Borrar(int id)
        {
            return _ventasDao.Delete(id) > 0;
        }

        private Ventas MapVentas(int? id, DateTime? fecha, PedidosDto[] ventaDto)
        {
            List<VentasDet> listventas = new List<VentasDet>();
            double precio = 0;
            for (int i = 0; i < ventaDto.Length; i++)
            {
                listventas.Add(new VentasDet()
                {
                    Articulo = ventaDto[i].Articulo,
                    Cantidad = ventaDto[i].Cantidad
                });
                precio += (ventaDto[i].Cantidad * ventaDto[i].Precio);
            }
            return new Ventas()
            {
                FechaAlta = fecha,
                Precio = precio,
                Sucursal = 1,
                VentasDet = listventas
            };
        }
    }
}
