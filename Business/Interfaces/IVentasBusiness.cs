using Business.Data_Transfer_Objects;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface IVentasBusiness
    {
        Task<IList<Ventas>> GetAllVentas();
        Task<List<Ventas>> GetVentasPorSucursal(int sucursal);
        Task<IList<Ventas>> GetArticulosCondicion(FiltrosDto filtros);
        Ventas GetByID(int id);
        bool Borrar(int id);
        Task<bool> Guardar(int id, DateTime? fecha, PedidosDto[] ventaDto);
    }
}
