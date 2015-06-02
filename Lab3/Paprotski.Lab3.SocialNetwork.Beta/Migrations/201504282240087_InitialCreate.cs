namespace Paprotski.Lab3.SocialNetwork.Beta.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Account",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false),
                        LastName = c.String(nullable: false),
                        Birthday = c.DateTime(nullable: false),
                        Gender = c.String(nullable: false),
                        Email = c.String(nullable: false),
                        Password = c.String(nullable: false),
                        RoleID = c.Int(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Role", t => t.RoleID)
                .Index(t => t.RoleID);
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        RoleName = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.PrivateMessage",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        DateSent = c.DateTime(nullable: false),
                        Message = c.String(nullable: false),
                        IsRead = c.Boolean(nullable: false),
                        SenderID = c.Int(nullable: false),
                        ReceiverID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Account", t => t.ReceiverID)
                .ForeignKey("dbo.Account", t => t.SenderID)
                .Index(t => t.SenderID)
                .Index(t => t.ReceiverID);
            
            CreateTable(
                "dbo.AccountAccount",
                c => new
                    {
                        Account_ID = c.Int(nullable: false),
                        Account_ID1 = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Account_ID, t.Account_ID1 })
                .ForeignKey("dbo.Account", t => t.Account_ID)
                .ForeignKey("dbo.Account", t => t.Account_ID1)
                .Index(t => t.Account_ID)
                .Index(t => t.Account_ID1);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.PrivateMessage", "SenderID", "dbo.Account");
            DropForeignKey("dbo.PrivateMessage", "ReceiverID", "dbo.Account");
            DropForeignKey("dbo.Account", "RoleID", "dbo.Role");
            DropForeignKey("dbo.AccountAccount", "Account_ID1", "dbo.Account");
            DropForeignKey("dbo.AccountAccount", "Account_ID", "dbo.Account");
            DropIndex("dbo.AccountAccount", new[] { "Account_ID1" });
            DropIndex("dbo.AccountAccount", new[] { "Account_ID" });
            DropIndex("dbo.PrivateMessage", new[] { "ReceiverID" });
            DropIndex("dbo.PrivateMessage", new[] { "SenderID" });
            DropIndex("dbo.Account", new[] { "RoleID" });
            DropTable("dbo.AccountAccount");
            DropTable("dbo.PrivateMessage");
            DropTable("dbo.Role");
            DropTable("dbo.Account");
        }
    }
}
