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
    public class ReparacionesDao: BaseDao<Reparaciones>, IReparacionesDao
    {
        public async Task<IList<Reparaciones>> GetFiltrados(EstadosEnum estado, int sucursal, string prod)
        {
            var query = DbSet.AsQueryable();
            query = estado.ToString() != "-1" ? query.Where(x => x.Estado == estado) : query;
            query = sucursal != -1 ? query.Where(x => x.Sucursal == sucursal) : query;
            query = !string.IsNullOrEmpty(prod) ? query.Where(x => x.Nombre.Contains(prod)) : query;
            var list = await query.ToListAsync();
            return list;
        }

        public async Task<Reparaciones> GetReparacionParaInforme(int id)
        {
            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Reparaciones
                                .Include(x=>x.Sucursales)
                                .Where(x=>x.Id == id)
                                .FirstOrDefaultAsync();
                    return list;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
