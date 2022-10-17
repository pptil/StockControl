namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Cuentas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cuentas()
        {
            Reparaciones = new HashSet<Reparaciones>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int cue_codigo { get; set; }

        [Required]
        [StringLength(40)]
        public string cue_denom { get; set; }

        [StringLength(50)]
        public string cue_website { get; set; }

        [StringLength(20)]
        public string cue_telefono { get; set; }

        [StringLength(30)]
        public string cue_mail { get; set; }

        [StringLength(50)]
        public string cue_direccion { get; set; }

        [StringLength(5)]
        public string cue_cp { get; set; }

        public int ciu_codigo { get; set; }

        public int esta_codigo { get; set; }

        public virtual Ciudades Ciudades { get; set; }

        public virtual Estados Estados { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reparaciones> Reparaciones { get; set; }
    }
}
