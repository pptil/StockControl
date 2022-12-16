namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class precioDouble : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Pedidos", "Precio", c => c.Double(nullable: true));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Pedidos", "Precio", c => c.Int(nullable: true));
        }
    }
}
