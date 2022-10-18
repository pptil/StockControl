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
            Pedidos = new HashSet<Pedidos>();
            Ventas = new HashSet<Ventas>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int user_cod { get; set; }

        [Required]
        [StringLength(30)]
        public string user_username { get; set; }

        [Required]
        [StringLength(50)]
        public string user_password { get; set; }

        [StringLength(20)]
        public string user_telefono { get; set; }

        [StringLength(50)]
        public string user_mail { get; set; }

        public int rol_cod { get; set; }

        public int? sucursal_cod { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Pedidos> Pedidos { get; set; }

        public virtual Roles Roles { get; set; }

        public virtual Sucursales Sucursales { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ventas> Ventas { get; set; }
    }
}
