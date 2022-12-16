namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ventasFK : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.VentasDet", "Id", "dbo.Ventas");
            DropIndex("dbo.VentasDet", new[] { "Id" });
            DropPrimaryKey("dbo.VentasDet");
            AddColumn("dbo.VentasDet", "Ventas_Id", c => c.Int(nullable: false));
            AlterColumn("dbo.VentasDet", "Id", c => c.Int(nullable: false, identity: true));
            AlterColumn("dbo.VentasDet", "Cantidad", c => c.Int());
            AddPrimaryKey("dbo.VentasDet", "Id");
            CreateIndex("dbo.VentasDet", "Ventas_Id");
            AddForeignKey("dbo.VentasDet", "Ventas_Id", "dbo.Ventas", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.VentasDet", "Ventas_Id", "dbo.Ventas");
            DropIndex("dbo.VentasDet", new[] { "Ventas_Id" });
            DropPrimaryKey("dbo.VentasDet");
            AlterColumn("dbo.VentasDet", "Cantidad", c => c.Int(nullable: false));
            AlterColumn("dbo.VentasDet", "Id", c => c.Int(nullable: false));
            DropColumn("dbo.VentasDet", "Ventas_Id");
            AddPrimaryKey("dbo.VentasDet", new[] { "Id", "Articulo", "Cantidad" });
            CreateIndex("dbo.VentasDet", "Id");
            AddForeignKey("dbo.VentasDet", "Id", "dbo.Ventas", "Id", cascadeDelete: true);
        }
    }
}
