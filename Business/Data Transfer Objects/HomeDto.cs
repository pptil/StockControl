using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Data_Transfer_Objects
{
    public class HomeDto
    {
        public Pedidos Pedido { get; set; }
        public Ventas Venta { get; set; }
        public Reparaciones Reparacion { get; set; }
        public IList<Articulos> Articulos { get; set; }
    }
}
