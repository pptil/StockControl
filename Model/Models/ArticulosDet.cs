namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("ArticulosDet")]
    public partial class ArticulosDet
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int art_codigo { get; set; }

        [StringLength(20)]
        public string art_color { get; set; }

        [Column(TypeName = "date")]
        public DateTime? art_fecalta { get; set; }

        public int? art_precio { get; set; }

        public int fab_codigo { get; set; }

        public int suc_codigo { get; set; }

        public int? prove_codigo { get; set; }

        public int? mod_codigo { get; set; }

        [StringLength(200)]
        public string art_imagenurl { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Fabricantes Fabricantes { get; set; }

        public virtual Modelos Modelos { get; set; }

        public virtual Proveedores Proveedores { get; set; }

        public virtual Sucursales Sucursales { get; set; }
    }
}
