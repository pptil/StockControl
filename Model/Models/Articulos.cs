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
            ComprasDet = new HashSet<ComprasDet>();
            ReparacionesDet = new HashSet<ReparacionesDet>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int art_codigo { get; set; }

        [Required]
        [StringLength(50)]
        public string art_denom { get; set; }

        public int esta_codigo { get; set; }

        public virtual Estados Estados { get; set; }

        public virtual ArticulosDet ArticulosDet { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ComprasDet> ComprasDet { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReparacionesDet> ReparacionesDet { get; set; }
    }
}
