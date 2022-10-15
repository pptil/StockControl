namespace Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("ComprasDet")]
    public partial class ComprasDet
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int com_codigo { get; set; }

        public int art_codigo { get; set; }

        public int? imp_codigo { get; set; }

        public int? comd_total { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Compras Compras { get; set; }

        public virtual Impuestos Impuestos { get; set; }
    }
}
