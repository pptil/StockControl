namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Pedidos
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int pedido_cod { get; set; }

        public int proveedor_cod { get; set; }

        public int pedido_precio { get; set; }

        public int? user_cod { get; set; }

        public int? sucursal_cod { get; set; }

        public DateTime? pedido_fecha { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        public virtual Usuarios Usuarios { get; set; }

        public virtual ICollection<PedidosDet> PedidosDet { get; set; }
    }
}
