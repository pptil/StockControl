using Business.Data_Transfer_Objects;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface IPedidosBusiness
    {
        Task<IList<Pedidos>> GetAllPedidos();
        Task<List<Pedidos>> GetPedidosPorSucursal(int sucursal);
        Task<IList<Pedidos>> GetArticulosCondicion(FiltrosDto filtros);
        Pedidos GetByID(int id);
        Task<bool> Guardar(int id, int proveedor, DateTime? fecha, PedidosDto[] pedidos);
        bool Borrar(int id);
    }
}
