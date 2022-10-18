namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("VentasDet")]
    public partial class VentasDet
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int venta_cod { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int articulo_cod { get; set; }

        public int? venta_cantidad { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Ventas Ventas { get; set; }
    }
}
