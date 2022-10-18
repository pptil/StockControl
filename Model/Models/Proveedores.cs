namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Proveedores
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int proveedor_cod { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(30)]
        public string proveedor_name { get; set; }

        [StringLength(30)]
        public string proveedor_telefono { get; set; }

        [StringLength(30)]
        public string proveedor_mail { get; set; }

        [StringLength(50)]
        public string proveedor_calle { get; set; }

        public int? provincia_cod { get; set; }

        [StringLength(50)]
        public string proveedor_ciudad { get; set; }

        public virtual Provincias Provincias { get; set; }
    }
}
