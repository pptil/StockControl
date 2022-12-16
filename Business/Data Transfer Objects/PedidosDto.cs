using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Data_Transfer_Objects
{
    public class PedidosDto
    {
        public int Id { get; set; }
        public int Articulo { get; set; }
        public string Nombre { get; set; }
        public double Precio { get; set; }
        public int Cantidad { get; set; }
        public double Total { get; set; }
    }
}
