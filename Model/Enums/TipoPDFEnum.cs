using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Enums
{
    public enum TipoPDFEnum : int
    {
        [Description("Pedido")]
        Pedido = 0,
        [Description("Venta")]
        Venta = 1,
        [Description("Reparacion")]
        Reparacion = 2
    }
}
