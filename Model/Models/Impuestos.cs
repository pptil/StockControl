namespace Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Impuestos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Impuestos()
        {
            ComprasDet = new HashSet<ComprasDet>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int imp_codigo { get; set; }

        [Required]
        [StringLength(30)]
        public string imp_denom { get; set; }

        public int imp_valor { get; set; }

        public int esta_codigo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ComprasDet> ComprasDet { get; set; }

        public virtual Estados Estados { get; set; }
    }
}
