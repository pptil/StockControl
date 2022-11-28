using Model.Enums;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IArticulosDao : 
        IGetAll<Articulos>,
        IGetBy<Articulos>,
        IInsert<Articulos>,
        IUpdate<Articulos>,
        IDelete<Articulos>
    {
        Task<List<Articulos>> GetAllArticulos();
        Task<List<Articulos>> GetArticulosPorSucursal(int sucursal);
        Task<IList<Articulos>> GetFiltrados(int? estado, int sucursal, int fabricante, string prod);
    }
}
