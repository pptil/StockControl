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
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public int? Fabricante { get; set; }

        [Required]
        [StringLength(100)]
        public string Nombre { get; set; }

        public int Stock { get; set; }

        public double Precio { get; set; }

        public int? Sucursal { get; set; }

        public bool? Estado { get; set; }

        public DateTime? FechaAlta { get; set; }

        public virtual Fabricantes Fabricantes { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PedidosDet> PedidosDet { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VentasDet> VentasDet { get; set; }

        public string EstadoString => Estado == true ? "Nuevo" : "Usado";
    }
}
