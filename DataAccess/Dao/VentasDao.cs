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

    }
}
