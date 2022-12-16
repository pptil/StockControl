namespace Modelo.Models
{
    using Model.Interfaces;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Proveedores : ISelectable
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [StringLength(30)]
        public string Nombre { get; set; }

        [StringLength(30)]
        public string Telefono { get; set; }

        [StringLength(30)]
        public string Mail { get; set; }

        [StringLength(50)]
        public string Calle { get; set; }

        public int? Provincia { get; set; }

        [StringLength(50)]
        public string Ciudad { get; set; }

        [StringLength(11)]
        public string CUIT { get; set; }

        public virtual Provincias Provincias { get; set; }
        public virtual ICollection<Pedidos> Pedidos { get; set; }
    }
}
