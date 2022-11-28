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
        public int Id { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Articulo { get; set; }

        [Key]
        [Column(Order = 2)]
        public int Cantidad { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Ventas Ventas { get; set; }
    }
}
