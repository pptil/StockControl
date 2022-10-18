namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Provincias
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Provincias()
        {
            Proveedores = new HashSet<Proveedores>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int provincia_cod { get; set; }

        [StringLength(10)]
        public string provincia_denom { get; set; }

        public int? pais_cod { get; set; }

        public virtual Paises Paises { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Proveedores> Proveedores { get; set; }
    }
}
