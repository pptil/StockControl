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
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int reparacion_cod { get; set; }

        [StringLength(50)]
        public string reparacion_producto { get; set; }

        [StringLength(100)]
        public string reparacion_desc { get; set; }

        public bool? reparacion_danado { get; set; }

        public bool? reparacion_transformador { get; set; }

        public bool? reparacion_funda { get; set; }

        [StringLength(50)]
        public string reparacion_obs { get; set; }

        public EstadosEnum reparacion_estado { get; set; }

        public double? reparacion_costo { get; set; }

        public int? sucursal_cod { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        public string danado => reparacion_danado == true ? "Dañado" : null;
        public string transformador => reparacion_transformador == true ? "Sin Transformador" : null;
        public string funda => reparacion_funda == true ? "Sin Funda" : null;
        public string detalle => $"{danado} {transformador} {funda}";
        public string estadostring => reparacion_estado.GetAttribute<DescriptionAttribute>().Description;


    }
}
