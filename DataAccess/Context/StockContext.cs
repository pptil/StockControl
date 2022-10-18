using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using Modelo.Models;

namespace DataAccess.Context
{
    public partial class StockContext : DbContext
    {
        public StockContext()
            : base("StockContext")
        {
        }

        public virtual DbSet<Articulos> Articulos { get; set; }
        public virtual DbSet<Fabricantes> Fabricantes { get; set; }
        public virtual DbSet<Paises> Paises { get; set; }
        public virtual DbSet<Pedidos> Pedidos { get; set; }
        public virtual DbSet<Provincias> Provincias { get; set; }
        public virtual DbSet<Reparaciones> Reparaciones { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<Sucursales> Sucursales { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }
        public virtual DbSet<Ventas> Ventas { get; set; }
        public virtual DbSet<PedidosDet> PedidosDet { get; set; }
        public virtual DbSet<Proveedores> Proveedores { get; set; }
        public virtual DbSet<VentasDet> VentasDet { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Articulos>()
                .Property(e => e.articulo_denom)
                .IsFixedLength();

            modelBuilder.Entity<Articulos>()
                .HasMany(e => e.VentasDet)
                .WithRequired(e => e.Articulos)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Fabricantes>()
                .Property(e => e.fabricante_denom)
                .IsFixedLength();

            modelBuilder.Entity<Paises>()
                .Property(e => e.pais_denom)
                .IsFixedLength();

            modelBuilder.Entity<Pedidos>()
                .HasOptional(e => e.PedidosDet)
                .WithRequired(e => e.Pedidos);

            modelBuilder.Entity<Provincias>()
                .Property(e => e.provincia_denom)
                .IsFixedLength();

            modelBuilder.Entity<Reparaciones>()
                .Property(e => e.reparacion_producto)
                .IsFixedLength();

            modelBuilder.Entity<Reparaciones>()
                .Property(e => e.reparacion_desc)
                .IsFixedLength();

            modelBuilder.Entity<Reparaciones>()
                .Property(e => e.reparacion_obs)
                .IsFixedLength();

            modelBuilder.Entity<Roles>()
                .Property(e => e.rol_denom)
                .IsFixedLength();

            modelBuilder.Entity<Roles>()
                .Property(e => e.habilitado)
                .IsFixedLength();

            modelBuilder.Entity<Roles>()
                .HasMany(e => e.Usuarios)
                .WithRequired(e => e.Roles)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sucursales>()
                .Property(e => e.sucursal_denom)
                .IsFixedLength();

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.user_username)
                .IsFixedLength();

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.user_password)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.user_telefono)
                .IsFixedLength();

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.user_mail)
                .IsFixedLength();

            modelBuilder.Entity<Ventas>()
                .HasMany(e => e.VentasDet)
                .WithRequired(e => e.Ventas)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.proveedor_name)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.proveedor_telefono)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.proveedor_mail)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.proveedor_calle)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.proveedor_ciudad)
                .IsFixedLength();
        }
    }
}
