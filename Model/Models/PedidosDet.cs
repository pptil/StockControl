namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("PedidosDet")]
    public partial class PedidosDet
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int? Articulo { get; set; }

        public int? Cantidad { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Pedidos Pedidos { get; set; }

        public double? Total => Articulos.Precio * Convert.ToDouble(Cantidad);
    }
}
