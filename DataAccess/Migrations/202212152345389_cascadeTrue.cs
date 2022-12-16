namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class cascadeTrue : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.PedidosDet", "Pedidos_Id", "dbo.Pedidos");
            DropForeignKey("dbo.VentasDet", "Id", "dbo.Ventas");
            AddForeignKey("dbo.PedidosDet", "Pedidos_Id", "dbo.Pedidos", "Id", cascadeDelete: true);
            AddForeignKey("dbo.VentasDet", "Id", "dbo.Ventas", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.VentasDet", "Id", "dbo.Ventas");
            DropForeignKey("dbo.PedidosDet", "Pedidos_Id", "dbo.Pedidos");
            AddForeignKey("dbo.VentasDet", "Id", "dbo.Ventas", "Id");
            AddForeignKey("dbo.PedidosDet", "Pedidos_Id", "dbo.Pedidos", "Id");
        }
    }
}
