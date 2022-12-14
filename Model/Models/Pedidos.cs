namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Pedidos
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public int Proveedor { get; set; }

        public int Precio { get; set; }

        public int? Usuario { get; set; }

        public int? Sucursal { get; set; }

        public DateTime? FechaAlta { get; set; }

        public DateTime? FechaModificación { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        public virtual Usuarios Usuarios { get; set; }
        public virtual Proveedores Proveedores { get; set; }

        public virtual ICollection<PedidosDet> PedidosDet { get; set; }

    }
}
