using Modelo.Models;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DataAccess.Context
{
    public partial class StockContext : DbContext
    {
        public StockContext()
            : base("StockConnection")
        {
        }
        public virtual DbSet<Articulos> Articulos { get; set; }
        public virtual DbSet<Fabricantes> Fabricantes { get; set; }
        public virtual DbSet<Paises> Paises { get; set; }
        public virtual DbSet<Pedidos> Pedidos { get; set; }
        public virtual DbSet<PedidosDet> PedidosDet { get; set; }
        public virtual DbSet<Proveedores> Proveedores { get; set; }
        public virtual DbSet<Provincias> Provincias { get; set; }
        public virtual DbSet<Reparaciones> Reparaciones { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<Sucursales> Sucursales { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }
        public virtual DbSet<Ventas> Ventas { get; set; }
        public virtual DbSet<VentasDet> VentasDet { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Articulos>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Articulos>()
                .HasMany(e => e.PedidosDet)
                .WithOptional(e => e.Articulos)
                .HasForeignKey(e => e.Articulo);

            modelBuilder.Entity<Articulos>()
                .HasMany(e => e.VentasDet)
                .WithRequired(e => e.Articulos)
                .HasForeignKey(e => e.Articulo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Fabricantes>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Fabricantes>()
                .HasMany(e => e.Articulos)
                .WithOptional(e => e.Fabricantes)
                .HasForeignKey(e => e.Fabricante);

            modelBuilder.Entity<Paises>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Paises>()
                .HasMany(e => e.Provincias)
                .WithOptional(e => e.Paises)
                .HasForeignKey(e => e.Pais);

            modelBuilder.Entity<Pedidos>()
                .HasMany(e => e.PedidosDet)
                .WithRequired(e => e.Pedidos)
                .HasForeignKey(e => e.Pedidos_Id)
                .WillCascadeOnDelete(true);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.Telefono)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.Mail)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.Calle)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.Ciudad)
                .IsFixedLength();

            modelBuilder.Entity<Proveedores>()
                .HasMany(e => e.Pedidos)
                .WithRequired(e => e.Proveedores)
                .HasForeignKey(e => e.Proveedor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Provincias>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Provincias>()
                .HasMany(e => e.Proveedores)
                .WithOptional(e => e.Provincias)
                .HasForeignKey(e => e.Provincia);

            modelBuilder.Entity<Reparaciones>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Reparaciones>()
                .Property(e => e.Descripcion)
                .IsFixedLength();

            modelBuilder.Entity<Reparaciones>()
                .Property(e => e.Observaciones)
                .IsFixedLength();

            modelBuilder.Entity<Roles>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Roles>()
                .HasMany(e => e.Usuarios)
                .WithRequired(e => e.Roles)
                .HasForeignKey(e => e.Rol)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sucursales>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Articulos)
                .WithOptional(e => e.Sucursales)
                .HasForeignKey(e => e.Sucursal);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Pedidos)
                .WithOptional(e => e.Sucursales)
                .HasForeignKey(e => e.Sucursal);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Reparaciones)
                .WithOptional(e => e.Sucursales)
                .HasForeignKey(e => e.Sucursal);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Usuarios)
                .WithOptional(e => e.Sucursales)
                .HasForeignKey(e => e.Sucursal);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Ventas)
                .WithOptional(e => e.Sucursales)
                .HasForeignKey(e => e.Sucursal);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Nombre)
                .IsFixedLength();

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Password)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Phone)
                .IsFixedLength();

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.Mail)
                .IsFixedLength();

            modelBuilder.Entity<Usuarios>()
                .HasMany(e => e.Pedidos)
                .WithOptional(e => e.Usuarios)
                .HasForeignKey(e => e.Usuario);

            modelBuilder.Entity<Usuarios>()
                .HasMany(e => e.Ventas)
                .WithOptional(e => e.Usuarios)
                .HasForeignKey(e => e.Usuario);

            modelBuilder.Entity<Ventas>()
                .HasMany(e => e.VentasDet)
                .WithRequired(e => e.Ventas)
                .HasForeignKey(e => e.Ventas_Id)
                .WillCascadeOnDelete(true);
        }
    }
}
