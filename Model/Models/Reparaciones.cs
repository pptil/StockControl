namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Reparaciones
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int repa_codigo { get; set; }

        [Column(TypeName = "date")]
        public DateTime repa_feccar { get; set; }

        [Column(TypeName = "date")]
        public DateTime repa_feccie { get; set; }

        public int cue_codigo { get; set; }

        public int esta_codigo { get; set; }

        [StringLength(200)]
        public string repa_observ { get; set; }

        public virtual Cuentas Cuentas { get; set; }

        public virtual Estados Estados { get; set; }

        public virtual ReparacionesDet ReparacionesDet { get; set; }
    }
}
