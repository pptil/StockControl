using Business.Data_Transfer_Objects;
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
        Task<IList<Articulos>> GetAllArticulos();
        Task<List<Articulos>> GetArticulosPorSucursal(int sucursal);
        Task<IList<Articulos>> GetArticulosCondicion(FiltrosDto filtros);
        Articulos GetArticulo(int id);
        bool Guardar(Articulos articulo);
        bool Borrar(int id);
    }
}
