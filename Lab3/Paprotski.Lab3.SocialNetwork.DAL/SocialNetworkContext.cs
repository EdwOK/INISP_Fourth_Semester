using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.DAL
{
    public class SocialNetworkContext : DbContext
    {
        public DbSet<Account> Accounts { get; set; }

        public DbSet<PrivateMessage> PrivateMessages { get; set; }

        public DbSet<Role> Roles { get; set; }

        public SocialNetworkContext()
            : base("SocialNetworkContext")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();

            modelBuilder.Entity<Account>().HasMany<Account>(f => f.Friends).WithMany();

            modelBuilder.Entity<PrivateMessage>()
                .HasRequired<Account>(f => f.Sender)
                .WithMany()
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PrivateMessage>()
                .HasRequired<Account>(f => f.Receiver)
                .WithMany()
                .WillCascadeOnDelete(false);
        }
    }
}
