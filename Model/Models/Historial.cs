namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("Historial")]
    public partial class Historial
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int his_codigo { get; set; }

        [Column(TypeName = "date")]
        public DateTime? his_fecha { get; set; }

        public int? usu_codigo { get; set; }

        [StringLength(200)]
        public string his_sector { get; set; }

        [StringLength(50)]
        public string his_accion { get; set; }

        [StringLength(200)]
        public string his_des { get; set; }

        public virtual Usuarios Usuarios { get; set; }
    }
}
