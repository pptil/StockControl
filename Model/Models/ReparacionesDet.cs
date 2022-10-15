namespace Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("ReparacionesDet")]
    public partial class ReparacionesDet
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int repa_codigo { get; set; }

        public int? art_codigo { get; set; }

        public int? repad_precio { get; set; }

        [StringLength(200)]
        public string repad_accion { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Reparaciones Reparaciones { get; set; }
    }
}
