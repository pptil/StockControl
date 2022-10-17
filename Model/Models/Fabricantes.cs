namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Fabricantes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Fabricantes()
        {
            ArticulosDet = new HashSet<ArticulosDet>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int fab_codigo { get; set; }

        [Required]
        [StringLength(30)]
        public string fab_denom { get; set; }

        [Column(TypeName = "date")]
        public DateTime? fab_feccar { get; set; }

        public int esta_codigo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ArticulosDet> ArticulosDet { get; set; }

        public virtual Estados Estados { get; set; }
    }
}
