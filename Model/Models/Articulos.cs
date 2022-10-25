namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Articulos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Articulos()
        {
            PedidosDet = new HashSet<PedidosDet>();
            VentasDet = new HashSet<VentasDet>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int articulo_cod { get; set; }

        public int? fabricante_cod { get; set; }

        [Required]
        [StringLength(100)]
        public string articulo_denom { get; set; }

        public int articulo_stock { get; set; }

        public double articulo_precio { get; set; }

        public int? sucursal_cod { get; set; }

        public bool? articulo_estado { get; set; }

        public virtual Fabricantes Fabricantes { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PedidosDet> PedidosDet { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VentasDet> VentasDet { get; set; }

        public string EstadoString => articulo_estado == true ? "Nuevo" : "Usado";
    }
}
