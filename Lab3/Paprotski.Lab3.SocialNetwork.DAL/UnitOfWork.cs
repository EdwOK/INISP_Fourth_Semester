using System;
using System.Linq;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.DAL
{
    public class UnitOfWork : IDisposable
    {
        private readonly SocialNetworkContext context = new SocialNetworkContext();

        private GenericRepository<Account> accountRepository;

        private GenericRepository<PrivateMessage> privateMessageRepository;

        private GenericRepository<Role> roleRepository;

        private bool disposed = false;

        public GenericRepository<Account> AccountRepository
        {
            get
            {
                return this.accountRepository ?? (this.accountRepository = new GenericRepository<Account>(this.context));
            }
        }

        public GenericRepository<PrivateMessage> PrivateMessageRepository
        {
            get
            {
                return this.privateMessageRepository ?? (this.privateMessageRepository = new GenericRepository<PrivateMessage>(this.context));
            }
        }

        public GenericRepository<Role> RoleRepository
        {
            get
            {
                return this.roleRepository ?? (this.roleRepository = new GenericRepository<Role>(this.context));
            }
        }

        public Account GetAccountByEmail(string email)
        {
            return this.context.Accounts.FirstOrDefault(model => model.Email == email);
        }

        public Account GetAccountByFullName(string firstName, string lastName)
        {
            return
                this.context.Accounts.FirstOrDefault(
                    model => model.FirstName == firstName || model.LastName == lastName);
        }

        public Role GetRole(string roleName)
        {
            return this.context.Roles.FirstOrDefault(model => model.RoleName == roleName);
        }

        public void Save()
        {
            this.context.SaveChanges();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed && disposing)
            {
                this.context.Dispose();
            }

            this.disposed = true;
        }

        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
