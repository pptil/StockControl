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
    public class VentasDao : BaseDao<Ventas>, IVentasDao
    {
        public async Task<List<Ventas>> GetVentasPorSucursal(int sucursal)
        {

            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Ventas
                                .Include("VentasDet")
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

        public async Task<IList<Ventas>> GetFiltrados(int? pedido, int sucursal, int proveedor, DateTime? desde, DateTime? hasta)
        {
            try
            {
                var query = DbSet.AsQueryable();
                query = pedido != 0 ? query.Where(x => x.Id == pedido) : query;
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

        public async Task<List<Ventas>> GetAllVentas()
        {

            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Ventas
                                .Include("VentasDet")
                                .ToListAsync();
                    return list;
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public Ventas GetVenta(int id)
        {

            try
            {
                using (var _context = new StockContext())
                {
                    var pedido = _context.Ventas
                                .Include(i => i.VentasDet.Select(p => p.Articulos))
                                .Include(i => i.VentasDet.Select(x=>x.Articulos.Sucursales))
                                .Include(i => i.VentasDet.Select(x => x.Articulos.Fabricantes))
                                .Include(i => i.VentasDet)
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

        public bool Actualizar(Ventas model)
        {
            using (var _dbContext = new StockContext())
            {
                var pedido = _dbContext.Ventas
                                .Where(p => p.Id == model.Id)
                                .Include(p => p.VentasDet)
                                .SingleOrDefault();

                if (pedido != null)
                {
                    // Update parent
                    _dbContext.Entry(pedido).CurrentValues.SetValues(model);

                    // Delete children
                    foreach (var pedidoDet in pedido.VentasDet.ToList())
                    {
                        if (!model.VentasDet.Any(c => c.Id == pedidoDet.Id))
                            _dbContext.VentasDet.Remove(pedidoDet);
                    }

                    // Update and Insert children
                    foreach (var item in model.VentasDet)
                    {
                        var pedidoDet = pedido.VentasDet
                            .Where(c => c.Id == item.Id && c.Id != default(int))
                            .SingleOrDefault();

                        if (pedidoDet != null)
                            // Update child
                            _dbContext.Entry(pedidoDet).CurrentValues.SetValues(item);
                        else
                        {
                            // Insert child
                            var detalle = new VentasDet
                            {
                                Articulo = item.Articulo,
                                Cantidad = item.Cantidad
                            };
                            pedido.VentasDet.Add(detalle);
                        }
                    }


                }
                return _dbContext.SaveChanges() > 0;
            }

        }

    }
}
