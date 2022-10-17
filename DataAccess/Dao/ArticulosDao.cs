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
    public class ArticulosDao : BaseDao<Articulos>, IArticulosDao
    {
        public async Task<List<Articulos>> GetArticulosPorSucursal(int sucursal)
        {
            
            try
            {
                using (var _context = new MusicaContext())
                {
                    var list = await _context.Articulos
                                .Include("ArticulosDet")
                                .Where(i => i.ArticulosDet.suc_codigo == sucursal)
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
