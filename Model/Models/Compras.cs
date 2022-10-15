namespace Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Compras
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int com_codigo { get; set; }

        [StringLength(20)]
        public string com_numerofisico { get; set; }

        [StringLength(200)]
        public string com_observ { get; set; }

        [Column(TypeName = "date")]
        public DateTime? com_fecha { get; set; }

        public int? usu_codigo { get; set; }

        public virtual Usuarios Usuarios { get; set; }

        public virtual ComprasDet ComprasDet { get; set; }
    }
}
