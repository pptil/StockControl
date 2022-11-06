using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface IArticulosBusiness
    {
        IList<Articulos> GetAllArticulos();
        Task<List<Articulos>> GetArticulosPorSucursal(int sucursal);
        Articulos GetArticulo(int id);
    }
}
