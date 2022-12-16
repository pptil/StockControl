namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("VentasDet")]
    public partial class VentasDet
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public int? Articulo { get; set; }

        public int? Cantidad { get; set; }

        public int Ventas_Id { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Ventas Ventas { get; set; }
        public double? Total => Articulos.Precio * Convert.ToDouble(Cantidad);
    }
}
