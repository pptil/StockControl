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
    public class PedidosBusiness : IPedidosBusiness
    {
        private readonly IPedidosDao _pedidosDao;
        public PedidosBusiness(IPedidosDao pedidosDao)
        {
            _pedidosDao = pedidosDao;
        }

        public async Task<IList<Pedidos>> GetAllPedidos()
        {
            return await _pedidosDao.GetAllPedidos();
        }

        public async Task<List<Pedidos>> GetPedidosPorSucursal(int sucursal)
        {
            return await _pedidosDao.GetPedidosPorSucursal(sucursal);
        }

        public async Task<IList<Pedidos>> GetArticulosCondicion(FiltrosDto filtro)
        {
            var list = await _pedidosDao.GetFiltrados(filtro.Pedido, filtro.Sucursal, filtro.Proveedor, filtro.FechaDesde, filtro.FechaHasta);
            return list;
        }

        public Pedidos GetByID(int id)
        {
            return _pedidosDao.GetPedido(id);
        }

        public async Task<bool> Guardar(int id, int proveedor, DateTime? fecha, PedidosDto[] pedidoDto)
        {
            if (proveedor != -1)
            {
                
                if (id == 0)
                {
                    var pedido = MapPedido(null, proveedor, fecha, pedidoDto);
                    pedido.FechaAlta = DateTime.Now;
                    return _pedidosDao.Insert(pedido) > 0;
                }
                else
                {
                    var pedido = MapPedido(id, proveedor, fecha, pedidoDto);
                    pedido.FechaModificación = DateTime.Now;
                    pedido.Id = id;
                    await _pedidosDao.SaveChangesAsync();
                    return _pedidosDao.Actualizar(pedido);
                }
            }
            else
            {
                throw new Exception();
            }           
            
        }

        public bool Borrar(int id)
        {
            return _pedidosDao.Delete(id)>0;
        }

        private Pedidos MapPedido(int? id, int proveedor, DateTime? fecha, PedidosDto[] pedidoDto)
        {
            List<PedidosDet> listpedidos = new List<PedidosDet>();
            double precio = 0;
            for (int i = 0; i < pedidoDto.Length; i++)
            {
                listpedidos.Add(new PedidosDet()
                {
                    Articulo = pedidoDto[i].Articulo,
                    Cantidad = pedidoDto[i].Cantidad
                });
                precio += (pedidoDto[i].Cantidad * pedidoDto[i].Precio);
            }
            return new Pedidos()
            {
                FechaAlta = fecha,
                Proveedor = proveedor,
                Sucursal = 1,
                Precio = precio,
                PedidosDet = listpedidos
            };
        }
    }
}
