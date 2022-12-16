namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrationOption : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Pedidos", "Precio", c => c.Double());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Pedidos", "Precio", c => c.Double(nullable: false));
        }
    }
}
