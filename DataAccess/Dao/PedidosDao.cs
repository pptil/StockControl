using DataAccess.Context;
using DataAccess.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Dao
{
    public class PedidosDao : BaseDao<Pedidos>, IPedidosDao
    {
        public async Task<List<Pedidos>> GetPedidosPorSucursal(int sucursal)
        {
            
            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Pedidos
                                .Include("PedidosDet")
                                .Where(i => i.Sucursal == sucursal)
                                .ToListAsync();
                    return list;
                }                            
            }
            catch (Exception)
            {

                throw;
            }
                      
        }

        public async Task<IList<Pedidos>> GetFiltrados(int? pedido, int sucursal, int proveedor, DateTime? desde, DateTime? hasta)
        {
            try
            {
                var query = DbSet.AsQueryable();
                query = pedido != 0 ? query.Where(x => x.Id == pedido) : query;
                query = proveedor != -1 ? query.Where(x => x.Proveedor == proveedor) : query;
                query = desde != null ? query.Where(x => x.FechaAlta >= desde) : query;
                query = hasta != null ? query.Where(x => x.FechaAlta <= hasta) : query;
                var list = await query.ToListAsync();
                return list;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        public async Task<List<Pedidos>> GetAllPedidos()
        {

            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Pedidos
                                .Include(x => x.PedidosDet)
                                .Include(x=>x.Proveedores)
                                .ToListAsync();
                    return list;
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public Pedidos GetPedido(int id)
        {

            try
            {
                using (var _context = new StockContext())
                {
                    var pedido =  _context.Pedidos
                                .Include(i=>i.PedidosDet.Select(p=>p.Articulos))
                                .Include(i => i.PedidosDet.Select(p => p.Articulos.Fabricantes))
                                .Include(i=>i.PedidosDet)
                                .Include(i=>i.Proveedores)
                                .Where(i => i.Id == id)
                                .FirstOrDefault();
                    return pedido;
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public bool Actualizar(Pedidos model)
        {
            using (var _dbContext = new StockContext())
            {
                var pedido = _dbContext.Pedidos
                                .Where(p => p.Id == model.Id)
                                .Include(p => p.PedidosDet)
                                .SingleOrDefault();

                if (pedido != null)
                {
                    // Update parent
                    _dbContext.Entry(pedido).CurrentValues.SetValues(model);

                    // Delete children
                    foreach (var pedidoDet in pedido.PedidosDet.ToList())
                    {
                        if (!model.PedidosDet.Any(c => c.Id == pedidoDet.Id))
                            _dbContext.PedidosDet.Remove(pedidoDet);
                    }

                    // Update and Insert children
                    foreach (var item in model.PedidosDet)
                    {
                        var pedidoDet = pedido.PedidosDet
                            .Where(c => c.Id == item.Id && c.Id != default(int))
                            .SingleOrDefault();

                        if (pedidoDet != null)
                            // Update child
                            _dbContext.Entry(pedidoDet).CurrentValues.SetValues(item);
                        else
                        {
                            // Insert child
                            var detalle = new PedidosDet
                            {
                                Articulo = item.Articulo,
                                Cantidad = item.Cantidad
                            };
                            pedido.PedidosDet.Add(detalle);
                        }
                    }

                    
                }
                return _dbContext.SaveChanges() > 0;
            }
            
        }

    }
}
