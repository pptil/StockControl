namespace Modelo.Models
{
    using Model.Enums;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Reparaciones
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int? Id { get; set; }

        [StringLength(50)]
        public string Nombre { get; set; }

        [StringLength(100)]
        public string Descripcion { get; set; }

        public bool? EstaDanado { get; set; }

        public bool? TieneTransformador { get; set; }

        public bool? TieneFunda { get; set; }

        [StringLength(50)]
        public string Observaciones { get; set; }

        public EstadosEnum Estado { get; set; }

        public double? Costo { get; set; }

        public int? Sucursal { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        public string danado => EstaDanado == true ? "Dañado" : null;
        public string transformador => TieneTransformador == true ? "Sin Transformador" : null;
        public string funda => TieneFunda == true ? "Sin Funda" : null;
        public string detalle => $"{danado} {transformador} {funda}";
        public string estadostring => Estado.GetAttribute<DescriptionAttribute>().Description;
    }
}
