namespace Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Proveedores
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Proveedores()
        {
            ArticulosDet = new HashSet<ArticulosDet>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int prove_codigo { get; set; }

        [Required]
        [StringLength(50)]
        public string prove_denom { get; set; }

        [StringLength(50)]
        public string prove_website { get; set; }

        [StringLength(20)]
        public string prove_telefono { get; set; }

        [StringLength(30)]
        public string prove_mail { get; set; }

        [StringLength(50)]
        public string prove_direccion { get; set; }

        [StringLength(5)]
        public string prove_cp { get; set; }

        public int ciu_codigo { get; set; }

        public int esta_codigo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ArticulosDet> ArticulosDet { get; set; }

        public virtual Ciudades Ciudades { get; set; }

        public virtual Estados Estados { get; set; }
    }
}
