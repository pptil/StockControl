namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ReparacionesModel : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Articulos",
                c => new
                    {
                        articulo_cod = c.Int(nullable: false),
                        fabricante_cod = c.Int(),
                        articulo_denom = c.String(nullable: false, maxLength: 100),
                        articulo_stock = c.Int(nullable: false),
                        articulo_precio = c.Double(nullable: false),
                        sucursal_cod = c.Int(),
                        articulo_estado = c.Boolean(),
                    })
                .PrimaryKey(t => t.articulo_cod)
                .ForeignKey("dbo.Fabricantes", t => t.fabricante_cod)
                .ForeignKey("dbo.Sucursales", t => t.sucursal_cod)
                .Index(t => t.fabricante_cod)
                .Index(t => t.sucursal_cod);
            
            CreateTable(
                "dbo.Fabricantes",
                c => new
                    {
                        fabricante_cod = c.Int(nullable: false),
                        fabricante_denom = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.fabricante_cod);
            
            CreateTable(
                "dbo.PedidosDet",
                c => new
                    {
                        pedido_cod = c.Int(nullable: false),
                        articulo_cod = c.Int(),
                        pedido_cantidad = c.Int(),
                        Pedidos_pedido_cod = c.Int(),
                    })
                .PrimaryKey(t => t.pedido_cod)
                .ForeignKey("dbo.Articulos", t => t.articulo_cod)
                .ForeignKey("dbo.Pedidos", t => t.Pedidos_pedido_cod)
                .Index(t => t.articulo_cod)
                .Index(t => t.Pedidos_pedido_cod);
            
            CreateTable(
                "dbo.Pedidos",
                c => new
                    {
                        pedido_cod = c.Int(nullable: false),
                        proveedor_cod = c.Int(nullable: false),
                        pedido_precio = c.Int(nullable: false),
                        user_cod = c.Int(),
                        sucursal_cod = c.Int(),
                        pedido_fecha = c.DateTime(),
                    })
                .PrimaryKey(t => t.pedido_cod)
                .ForeignKey("dbo.Sucursales", t => t.sucursal_cod)
                .ForeignKey("dbo.Usuarios", t => t.user_cod)
                .Index(t => t.user_cod)
                .Index(t => t.sucursal_cod);
            
            CreateTable(
                "dbo.Sucursales",
                c => new
                    {
                        sucursal_cod = c.Int(nullable: false),
                        sucursal_denom = c.String(nullable: false, maxLength: 10),
                    })
                .PrimaryKey(t => t.sucursal_cod);
            
            CreateTable(
                "dbo.Reparaciones",
                c => new
                    {
                        reparacion_cod = c.Int(nullable: false, identity: true),
                        reparacion_producto = c.String(maxLength: 100),
                        reparacion_desc = c.String(maxLength: 1000),
                        reparacion_danado = c.Boolean(),
                        reparacion_transformador = c.Boolean(),
                        reparacion_funda = c.Boolean(),
                        reparacion_obs = c.String(maxLength: 1000),
                        reparacion_estado = c.Int(nullable: false),
                        reparacion_costo = c.Double(),
                        sucursal_cod = c.Int(),
                    })
                .PrimaryKey(t => t.reparacion_cod)
                .ForeignKey("dbo.Sucursales", t => t.sucursal_cod)
                .Index(t => t.sucursal_cod);
            
            CreateTable(
                "dbo.Usuarios",
                c => new
                    {
                        user_cod = c.Int(nullable: false),
                        user_username = c.String(nullable: false, maxLength: 30),
                        user_password = c.String(nullable: false, maxLength: 50),
                        user_telefono = c.String(maxLength: 20),
                        user_mail = c.String(maxLength: 50),
                        rol_cod = c.Int(nullable: false),
                        sucursal_cod = c.Int(),
                    })
                .PrimaryKey(t => t.user_cod)
                .ForeignKey("dbo.Roles", t => t.rol_cod, cascadeDelete: true)
                .ForeignKey("dbo.Sucursales", t => t.sucursal_cod)
                .Index(t => t.rol_cod)
                .Index(t => t.sucursal_cod);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        rol_cod = c.Int(nullable: false),
                        rol_denom = c.String(nullable: false, maxLength: 20),
                        habilitado = c.Binary(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.rol_cod);
            
            CreateTable(
                "dbo.Ventas",
                c => new
                    {
                        venta_cod = c.Int(nullable: false),
                        venta_precio = c.Double(),
                        user_cod = c.Int(),
                        sucursal_cod = c.Int(),
                        venta_fecha = c.DateTime(),
                    })
                .PrimaryKey(t => t.venta_cod)
                .ForeignKey("dbo.Sucursales", t => t.sucursal_cod)
                .ForeignKey("dbo.Usuarios", t => t.user_cod)
                .Index(t => t.user_cod)
                .Index(t => t.sucursal_cod);
            
            CreateTable(
                "dbo.VentasDet",
                c => new
                    {
                        venta_cod = c.Int(nullable: false),
                        articulo_cod = c.Int(nullable: false),
                        venta_cantidad = c.Int(),
                    })
                .PrimaryKey(t => new { t.venta_cod, t.articulo_cod })
                .ForeignKey("dbo.Articulos", t => t.articulo_cod, cascadeDelete: true)
                .ForeignKey("dbo.Ventas", t => t.venta_cod, cascadeDelete: true)
                .Index(t => t.venta_cod)
                .Index(t => t.articulo_cod);
            
            CreateTable(
                "dbo.Paises",
                c => new
                    {
                        pais_cod = c.Int(nullable: false),
                        pais_denom = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.pais_cod);
            
            CreateTable(
                "dbo.Provincias",
                c => new
                    {
                        provincia_cod = c.Int(nullable: false),
                        provincia_denom = c.String(maxLength: 10),
                        pais_cod = c.Int(),
                    })
                .PrimaryKey(t => t.provincia_cod)
                .ForeignKey("dbo.Paises", t => t.pais_cod)
                .Index(t => t.pais_cod);
            
            CreateTable(
                "dbo.Proveedores",
                c => new
                    {
                        proveedor_cod = c.Int(nullable: false),
                        proveedor_name = c.String(nullable: false, maxLength: 30),
                        proveedor_telefono = c.String(maxLength: 30),
                        proveedor_mail = c.String(maxLength: 30),
                        proveedor_calle = c.String(maxLength: 50),
                        provincia_cod = c.Int(),
                        proveedor_ciudad = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => new { t.proveedor_cod, t.proveedor_name })
                .ForeignKey("dbo.Provincias", t => t.provincia_cod)
                .Index(t => t.provincia_cod);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Proveedores", "provincia_cod", "dbo.Provincias");
            DropForeignKey("dbo.Provincias", "pais_cod", "dbo.Paises");
            DropForeignKey("dbo.VentasDet", "venta_cod", "dbo.Ventas");
            DropForeignKey("dbo.VentasDet", "articulo_cod", "dbo.Articulos");
            DropForeignKey("dbo.Ventas", "user_cod", "dbo.Usuarios");
            DropForeignKey("dbo.Ventas", "sucursal_cod", "dbo.Sucursales");
            DropForeignKey("dbo.Usuarios", "sucursal_cod", "dbo.Sucursales");
            DropForeignKey("dbo.Usuarios", "rol_cod", "dbo.Roles");
            DropForeignKey("dbo.Pedidos", "user_cod", "dbo.Usuarios");
            DropForeignKey("dbo.Reparaciones", "sucursal_cod", "dbo.Sucursales");
            DropForeignKey("dbo.Pedidos", "sucursal_cod", "dbo.Sucursales");
            DropForeignKey("dbo.Articulos", "sucursal_cod", "dbo.Sucursales");
            DropForeignKey("dbo.PedidosDet", "Pedidos_pedido_cod", "dbo.Pedidos");
            DropForeignKey("dbo.PedidosDet", "articulo_cod", "dbo.Articulos");
            DropForeignKey("dbo.Articulos", "fabricante_cod", "dbo.Fabricantes");
            DropIndex("dbo.Proveedores", new[] { "provincia_cod" });
            DropIndex("dbo.Provincias", new[] { "pais_cod" });
            DropIndex("dbo.VentasDet", new[] { "articulo_cod" });
            DropIndex("dbo.VentasDet", new[] { "venta_cod" });
            DropIndex("dbo.Ventas", new[] { "sucursal_cod" });
            DropIndex("dbo.Ventas", new[] { "user_cod" });
            DropIndex("dbo.Usuarios", new[] { "sucursal_cod" });
            DropIndex("dbo.Usuarios", new[] { "rol_cod" });
            DropIndex("dbo.Reparaciones", new[] { "sucursal_cod" });
            DropIndex("dbo.Pedidos", new[] { "sucursal_cod" });
            DropIndex("dbo.Pedidos", new[] { "user_cod" });
            DropIndex("dbo.PedidosDet", new[] { "Pedidos_pedido_cod" });
            DropIndex("dbo.PedidosDet", new[] { "articulo_cod" });
            DropIndex("dbo.Articulos", new[] { "sucursal_cod" });
            DropIndex("dbo.Articulos", new[] { "fabricante_cod" });
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
