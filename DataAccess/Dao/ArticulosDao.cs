using DataAccess.Context;
using DataAccess.Interfaces;
using Model.Enums;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Dao
{
    public class ArticulosDao : BaseDao<Articulos>, IArticulosDao
    {
        public async Task<List<Articulos>> GetArticulosPorSucursal(int sucursal)
        {
            
            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Articulos
                                .Include("Fabricantes")
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

        public async Task<List<Articulos>> GetAllArticulos()
        {

            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Articulos
                                .Include("Fabricantes")
                                .ToListAsync();
                    return list;
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public async Task<IList<Articulos>> GetFiltrados(int? estado, int sucursal, int fabricante, string prod)
        {
            bool estadoBool = estado == 1 ? true : false;
            var query = DbSet.Include("Fabricantes").AsQueryable();
            query = estado != -1 ? query.Where(x => x.Estado == estadoBool) : query;
            query = sucursal != -1 ? query.Where(x => x.Sucursal == sucursal) : query;
            query = fabricante != -1 ? query.Where(x => x.Fabricante == fabricante) : query;
            query = !string.IsNullOrEmpty(prod) ? query.Where(x => x.Nombre.Contains(prod)) : query;
            var list = await query.ToListAsync();
            return list;
        }

    }
}
