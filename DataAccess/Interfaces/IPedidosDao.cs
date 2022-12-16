using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IPedidosDao : 
        IGetAll<Pedidos>,
        IGetBy<Pedidos>,
        IDelete<Pedidos>,
        IInsert<Pedidos>,
        IUpdate<Pedidos>,
        ISaveChanges
    {
        Task<List<Pedidos>> GetAllPedidos();
        Task<IList<Pedidos>> GetFiltrados(int? pedido, int sucursal, int proveedor, DateTime? desde, DateTime? hasta);
        Task<List<Pedidos>> GetPedidosPorSucursal(int sucursal);
        Pedidos GetPedido(int id);
        bool Actualizar(Pedidos model);
    }
}
