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
                                .Where(i => i.sucursal_cod == sucursal)
                                .ToListAsync();
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
