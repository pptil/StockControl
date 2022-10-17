namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("ReportesDet")]
    public partial class ReportesDet
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int rep_codigo { get; set; }

        public int art_codigo { get; set; }

        public int cue_codigo { get; set; }

        public int? rep_cantidad { get; set; }

        public int? rep_total { get; set; }

        public virtual Reportes Reportes { get; set; }
    }
}
