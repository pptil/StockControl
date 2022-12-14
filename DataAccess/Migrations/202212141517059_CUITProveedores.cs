namespace DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CUITProveedores : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Proveedores", "CUIT", c => c.String(maxLength: 11));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Proveedores", "CUIT");
        }
    }
}
