namespace Modelo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class Usuarios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuarios()
        {
            Compras = new HashSet<Compras>();
            Historial = new HashSet<Historial>();
            Reportes = new HashSet<Reportes>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int usu_codigo { get; set; }

        [Required]
        [StringLength(30)]
        public string usu_user { get; set; }

        [Required]
        [StringLength(30)]
        public string usu_pass { get; set; }

        public int niv_codigo { get; set; }

        public int suc_codigo { get; set; }

        public int esta_codigo { get; set; }

        [StringLength(50)]
        public string usu_name { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Compras> Compras { get; set; }

        public virtual Estados Estados { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Historial> Historial { get; set; }

        public virtual Niveles Niveles { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reportes> Reportes { get; set; }

        public virtual Sucursales Sucursales { get; set; }
    }
}
