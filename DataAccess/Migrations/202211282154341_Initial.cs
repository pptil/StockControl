namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Articulos",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Fabricante = c.Int(),
                        Nombre = c.String(nullable: false, maxLength: 100, fixedLength: true),
                        Stock = c.Int(nullable: false),
                        Precio = c.Double(nullable: false),
                        Sucursal = c.Int(),
                        Estado = c.Boolean(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Fabricantes", t => t.Fabricante)
                .ForeignKey("dbo.Sucursales", t => t.Sucursal)
                .Index(t => t.Fabricante)
                .Index(t => t.Sucursal);
            
            CreateTable(
                "dbo.Fabricantes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(maxLength: 50, fixedLength: true),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PedidosDet",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Articulo = c.Int(),
                        Cantidad = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Pedidos", t => t.Id)
                .ForeignKey("dbo.Articulos", t => t.Articulo)
                .Index(t => t.Id)
                .Index(t => t.Articulo);
            
            CreateTable(
                "dbo.Pedidos",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Proveedor = c.Int(nullable: false),
                        Precio = c.Int(nullable: false),
                        Usuario = c.Int(),
                        Sucursal = c.Int(),
                        FechaAlta = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Sucursales", t => t.Sucursal)
                .ForeignKey("dbo.Usuarios", t => t.Usuario)
                .Index(t => t.Usuario)
                .Index(t => t.Sucursal);
            
            CreateTable(
                "dbo.Sucursales",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Nombre = c.String(nullable: false, maxLength: 50, fixedLength: true),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Reparaciones",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(maxLength: 50, fixedLength: true),
                        Descripcion = c.String(maxLength: 100, fixedLength: true),
                        EstaDanado = c.Boolean(),
                        TieneTransformador = c.Boolean(),
                        TieneFunda = c.Boolean(),
                        Observaciones = c.String(maxLength: 50, fixedLength: true),
                        Estado = c.Int(nullable: false),
                        Costo = c.Double(),
                        Sucursal = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Sucursales", t => t.Sucursal)
                .Index(t => t.Sucursal);
            
            CreateTable(
                "dbo.Usuarios",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(nullable: false, maxLength: 30, fixedLength: true),
                        Password = c.String(nullable: false, maxLength: 50, fixedLength: true, unicode: false),
                        Phone = c.String(maxLength: 20, fixedLength: true),
                        Mail = c.String(maxLength: 50, fixedLength: true),
                        Rol = c.Int(nullable: false),
                        Sucursal = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Roles", t => t.Rol)
                .ForeignKey("dbo.Sucursales", t => t.Sucursal)
                .Index(t => t.Rol)
                .Index(t => t.Sucursal);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Nombre = c.String(nullable: false, maxLength: 20, fixedLength: true),
                        Habilitado = c.Boolean(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Ventas",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Precio = c.Double(),
                        Usuario = c.Int(),
                        Sucursal = c.Int(),
                        FechaAlta = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Usuarios", t => t.Usuario)
                .ForeignKey("dbo.Sucursales", t => t.Sucursal)
                .Index(t => t.Usuario)
                .Index(t => t.Sucursal);
            
            CreateTable(
                "dbo.VentasDet",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Articulo = c.Int(nullable: false),
                        Cantidad = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Id, t.Articulo, t.Cantidad })
                .ForeignKey("dbo.Ventas", t => t.Id)
                .ForeignKey("dbo.Articulos", t => t.Articulo)
                .Index(t => t.Id)
                .Index(t => t.Articulo);
            
            CreateTable(
                "dbo.Paises",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Nombre = c.String(maxLength: 50, fixedLength: true),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Provincias",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Nombre = c.String(maxLength: 10, fixedLength: true),
                        Pais = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Paises", t => t.Pais)
                .Index(t => t.Pais);
            
            CreateTable(
                "dbo.Proveedores",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(nullable: false, maxLength: 30, fixedLength: true),
                        Telefono = c.String(maxLength: 30, fixedLength: true),
                        Mail = c.String(maxLength: 30, fixedLength: true),
                        Calle = c.String(maxLength: 50, fixedLength: true),
                        Provincia = c.Int(),
                        Ciudad = c.String(maxLength: 50, fixedLength: true),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Provincias", t => t.Provincia)
                .Index(t => t.Provincia);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Provincias", "Pais", "dbo.Paises");
            DropForeignKey("dbo.Proveedores", "Provincia", "dbo.Provincias");
            DropForeignKey("dbo.VentasDet", "Articulo", "dbo.Articulos");
            DropForeignKey("dbo.PedidosDet", "Articulo", "dbo.Articulos");
            DropForeignKey("dbo.Ventas", "Sucursal", "dbo.Sucursales");
            DropForeignKey("dbo.Usuarios", "Sucursal", "dbo.Sucursales");
            DropForeignKey("dbo.Ventas", "Usuario", "dbo.Usuarios");
            DropForeignKey("dbo.VentasDet", "Id", "dbo.Ventas");
            DropForeignKey("dbo.Usuarios", "Rol", "dbo.Roles");
            DropForeignKey("dbo.Pedidos", "Usuario", "dbo.Usuarios");
            DropForeignKey("dbo.Reparaciones", "Sucursal", "dbo.Sucursales");
            DropForeignKey("dbo.Pedidos", "Sucursal", "dbo.Sucursales");
            DropForeignKey("dbo.Articulos", "Sucursal", "dbo.Sucursales");
            DropForeignKey("dbo.PedidosDet", "Id", "dbo.Pedidos");
            DropForeignKey("dbo.Articulos", "Fabricante", "dbo.Fabricantes");
            DropIndex("dbo.Proveedores", new[] { "Provincia" });
            DropIndex("dbo.Provincias", new[] { "Pais" });
            DropIndex("dbo.VentasDet", new[] { "Articulo" });
            DropIndex("dbo.VentasDet", new[] { "Id" });
            DropIndex("dbo.Ventas", new[] { "Sucursal" });
            DropIndex("dbo.Ventas", new[] { "Usuario" });
            DropIndex("dbo.Usuarios", new[] { "Sucursal" });
            DropIndex("dbo.Usuarios", new[] { "Rol" });
            DropIndex("dbo.Reparaciones", new[] { "Sucursal" });
            DropIndex("dbo.Pedidos", new[] { "Sucursal" });
            DropIndex("dbo.Pedidos", new[] { "Usuario" });
            DropIndex("dbo.PedidosDet", new[] { "Articulo" });
            DropIndex("dbo.PedidosDet", new[] { "Id" });
            DropIndex("dbo.Articulos", new[] { "Sucursal" });
            DropIndex("dbo.Articulos", new[] { "Fabricante" });
            DropTable("dbo.Proveedores");
            DropTable("dbo.Provincias");
            DropTable("dbo.Paises");
            DropTable("dbo.VentasDet");
            DropTable("dbo.Ventas");
            DropTable("dbo.Roles");
            DropTable("dbo.Usuarios");
            DropTable("dbo.Reparaciones");
            DropTable("dbo.Sucursales");
            DropTable("dbo.Pedidos");
            DropTable("dbo.PedidosDet");
            DropTable("dbo.Fabricantes");
            DropTable("dbo.Articulos");
        }
    }
}
