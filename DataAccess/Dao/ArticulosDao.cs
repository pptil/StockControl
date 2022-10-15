using DataAccess.Context;
using DataAccess.Interfaces;
using Model.Models;
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
        private MusicaContext _context;

        public async Task<List<Articulos>> GetArticulosPorSucursal(int sucursal)
        {
            return await _context.Articulos
                .Include("ArticulosDet")
                .Where(i => i.ArticulosDet.suc_codigo == sucursal)
                .ToListAsync();
        }

    }
}
