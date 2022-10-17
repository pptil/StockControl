using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using Modelo.Models;

namespace DataAccess.Context
{
    public partial class MusicaContext : DbContext
    {
        public MusicaContext()
            : base("MusicaConnection")
        {
        }

        public virtual DbSet<Acciones> Acciones { get; set; }
        public virtual DbSet<Articulos> Articulos { get; set; }
        public virtual DbSet<ArticulosDet> ArticulosDet { get; set; }
        public virtual DbSet<Ciudades> Ciudades { get; set; }
        public virtual DbSet<Compras> Compras { get; set; }
        public virtual DbSet<ComprasDet> ComprasDet { get; set; }
        public virtual DbSet<Cuentas> Cuentas { get; set; }
        public virtual DbSet<Estados> Estados { get; set; }
        public virtual DbSet<Fabricantes> Fabricantes { get; set; }
        public virtual DbSet<Historial> Historial { get; set; }
        public virtual DbSet<Impuestos> Impuestos { get; set; }
        public virtual DbSet<Modelos> Modelos { get; set; }
        public virtual DbSet<Niveles> Niveles { get; set; }
        public virtual DbSet<Paises> Paises { get; set; }
        public virtual DbSet<Proveedores> Proveedores { get; set; }
        public virtual DbSet<Provincias> Provincias { get; set; }
        public virtual DbSet<Reparaciones> Reparaciones { get; set; }
        public virtual DbSet<ReparacionesDet> ReparacionesDet { get; set; }
        public virtual DbSet<Reportes> Reportes { get; set; }
        public virtual DbSet<ReportesDet> ReportesDet { get; set; }
        public virtual DbSet<ReportesTipos> ReportesTipos { get; set; }
        public virtual DbSet<Sucursales> Sucursales { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Acciones>()
                .Property(e => e.acc_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Articulos>()
                .Property(e => e.art_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Articulos>()
                .HasOptional(e => e.ArticulosDet)
                .WithRequired(e => e.Articulos);

            modelBuilder.Entity<Articulos>()
                .HasMany(e => e.ComprasDet)
                .WithRequired(e => e.Articulos)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ArticulosDet>()
                .Property(e => e.art_color)
                .IsUnicode(false);

            modelBuilder.Entity<ArticulosDet>()
                .Property(e => e.art_imagenurl)
                .IsUnicode(false);

            modelBuilder.Entity<Ciudades>()
                .Property(e => e.ciu_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Ciudades>()
                .HasMany(e => e.Cuentas)
                .WithRequired(e => e.Ciudades)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Ciudades>()
                .HasMany(e => e.Proveedores)
                .WithRequired(e => e.Ciudades)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Compras>()
                .Property(e => e.com_numerofisico)
                .IsUnicode(false);

            modelBuilder.Entity<Compras>()
                .Property(e => e.com_observ)
                .IsUnicode(false);

            modelBuilder.Entity<Compras>()
                .HasOptional(e => e.ComprasDet)
                .WithRequired(e => e.Compras);

            modelBuilder.Entity<Cuentas>()
                .Property(e => e.cue_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Cuentas>()
                .Property(e => e.cue_website)
                .IsUnicode(false);

            modelBuilder.Entity<Cuentas>()
                .Property(e => e.cue_telefono)
                .IsUnicode(false);

            modelBuilder.Entity<Cuentas>()
                .Property(e => e.cue_mail)
                .IsUnicode(false);

            modelBuilder.Entity<Cuentas>()
                .Property(e => e.cue_direccion)
                .IsUnicode(false);

            modelBuilder.Entity<Cuentas>()
                .Property(e => e.cue_cp)
                .IsUnicode(false);

            modelBuilder.Entity<Cuentas>()
                .HasMany(e => e.Reparaciones)
                .WithRequired(e => e.Cuentas)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .Property(e => e.esta_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Articulos)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Cuentas)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Fabricantes)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Impuestos)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Modelos)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Niveles)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Proveedores)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Reparaciones)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estados>()
                .HasMany(e => e.Usuarios)
                .WithRequired(e => e.Estados)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Fabricantes>()
                .Property(e => e.fab_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Fabricantes>()
                .HasMany(e => e.ArticulosDet)
                .WithRequired(e => e.Fabricantes)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Historial>()
                .Property(e => e.his_sector)
                .IsUnicode(false);

            modelBuilder.Entity<Historial>()
                .Property(e => e.his_accion)
                .IsUnicode(false);

            modelBuilder.Entity<Historial>()
                .Property(e => e.his_des)
                .IsUnicode(false);

            modelBuilder.Entity<Impuestos>()
                .Property(e => e.imp_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Modelos>()
                .Property(e => e.mod_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Niveles>()
                .Property(e => e.niv_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Niveles>()
                .HasMany(e => e.Usuarios)
                .WithRequired(e => e.Niveles)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Paises>()
                .Property(e => e.pais_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.prove_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.prove_website)
                .IsUnicode(false);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.prove_telefono)
                .IsUnicode(false);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.prove_mail)
                .IsUnicode(false);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.prove_direccion)
                .IsUnicode(false);

            modelBuilder.Entity<Proveedores>()
                .Property(e => e.prove_cp)
                .IsUnicode(false);

            modelBuilder.Entity<Provincias>()
                .Property(e => e.prov_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Reparaciones>()
                .Property(e => e.repa_observ)
                .IsUnicode(false);

            modelBuilder.Entity<Reparaciones>()
                .HasOptional(e => e.ReparacionesDet)
                .WithRequired(e => e.Reparaciones);

            modelBuilder.Entity<ReparacionesDet>()
                .Property(e => e.repad_accion)
                .IsUnicode(false);

            modelBuilder.Entity<Reportes>()
                .Property(e => e.rep_observ)
                .IsUnicode(false);

            modelBuilder.Entity<Reportes>()
                .HasOptional(e => e.ReportesDet)
                .WithRequired(e => e.Reportes);

            modelBuilder.Entity<ReportesTipos>()
                .Property(e => e.reptipo_denom)
                .IsUnicode(false);

            modelBuilder.Entity<ReportesTipos>()
                .HasMany(e => e.Reportes)
                .WithOptional(e => e.ReportesTipos)
                .HasForeignKey(e => e.reptipo_codigo);

            modelBuilder.Entity<ReportesTipos>()
                .HasMany(e => e.Reportes1)
                .WithOptional(e => e.ReportesTipos1)
                .HasForeignKey(e => e.reptipo_codigo);

            modelBuilder.Entity<Sucursales>()
                .Property(e => e.suc_denom)
                .IsUnicode(false);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.ArticulosDet)
                .WithRequired(e => e.Sucursales)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Reportes)
                .WithRequired(e => e.Sucursales)
                .HasForeignKey(e => e.suc_codigo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Reportes1)
                .WithRequired(e => e.Sucursales1)
                .HasForeignKey(e => e.suc_codigo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sucursales>()
                .HasMany(e => e.Usuarios)
                .WithRequired(e => e.Sucursales)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.usu_user)
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.usu_pass)
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .Property(e => e.usu_name)
                .IsUnicode(false);

            modelBuilder.Entity<Usuarios>()
                .HasMany(e => e.Reportes)
                .WithRequired(e => e.Usuarios)
                .WillCascadeOnDelete(false);
        }
    }
}
