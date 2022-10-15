namespace Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Reportes
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int rep_codigo { get; set; }

        [Column(TypeName = "date")]
        public DateTime rep_fecha { get; set; }

        public int? reptipo_codigo { get; set; }

        [StringLength(200)]
        public string rep_observ { get; set; }

        public int suc_codigo { get; set; }

        public int usu_codigo { get; set; }

        public int? acc_codigo { get; set; }

        public virtual Acciones Acciones { get; set; }

        public virtual ReportesTipos ReportesTipos { get; set; }

        public virtual ReportesTipos ReportesTipos1 { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        public virtual Sucursales Sucursales1 { get; set; }

        public virtual Usuarios Usuarios { get; set; }

        public virtual ReportesDet ReportesDet { get; set; }
    }
}
