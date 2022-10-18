namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("PedidosDet")]
    public partial class PedidosDet
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int pedido_cod { get; set; }

        public int? articulo_cod { get; set; }

        public int? pedido_cantidad { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Pedidos Pedidos { get; set; }
    }
}
