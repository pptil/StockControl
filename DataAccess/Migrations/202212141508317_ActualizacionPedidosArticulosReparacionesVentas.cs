namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ActualizacionPedidosArticulosReparacionesVentas : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Articulos", "FechaAlta", c => c.DateTime());
            AddColumn("dbo.Pedidos", "FechaModificación", c => c.DateTime());
            AddColumn("dbo.Pedidos", "Proveedores_Id", c => c.Int());
            AddColumn("dbo.Reparaciones", "FechaAlta", c => c.DateTime());
            AddColumn("dbo.Ventas", "FechaModificacion", c => c.DateTime());
            CreateIndex("dbo.Pedidos", "Proveedores_Id");
            AddForeignKey("dbo.Pedidos", "Proveedores_Id", "dbo.Proveedores", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Pedidos", "Proveedores_Id", "dbo.Proveedores");
            DropIndex("dbo.Pedidos", new[] { "Proveedores_Id" });
            DropColumn("dbo.Ventas", "FechaModificacion");
            DropColumn("dbo.Reparaciones", "FechaAlta");
            DropColumn("dbo.Pedidos", "Proveedores_Id");
            DropColumn("dbo.Pedidos", "FechaModificación");
            DropColumn("dbo.Articulos", "FechaAlta");
        }
    }
}
