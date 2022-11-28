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
        Pedidos GetByID(int id);
    }
}
