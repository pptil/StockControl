using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IVentasDao :
        IGetAll<Ventas>,
        IGetBy<Ventas>,
        IDelete<Ventas>,
        IInsert<Ventas>,
        ISaveChanges
    {
        Task<List<Ventas>> GetAllVentas();
        Task<IList<Ventas>> GetFiltrados(int? pedido, int sucursal, int proveedor, DateTime? desde, DateTime? hasta);
        Task<List<Ventas>> GetVentasPorSucursal(int sucursal);
        Ventas GetVenta(int id);
        bool Actualizar(Ventas venta);
    }
}
