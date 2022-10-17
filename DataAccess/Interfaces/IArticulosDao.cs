using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IArticulosDao : 
        IGetAll<Articulos>
    {
        Task<List<Articulos>> GetArticulosPorSucursal(int sucursal);
    }
}
