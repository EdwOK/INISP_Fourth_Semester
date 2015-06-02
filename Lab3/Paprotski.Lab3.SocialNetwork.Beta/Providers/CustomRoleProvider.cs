using System;
using System.Linq;
using System.Collections.Generic;
using System.Web.Security;
using Paprotski.Lab3.SocialNetwork.DAL;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.Beta.Providers
{
    public class CustomRoleProvider : RoleProvider, IDisposable
    {
        private UnitOfWork unitOfWork = new UnitOfWork();

        public override bool IsUserInRole(string email, string roleName)
        {
            var role = this.unitOfWork.GetRole(roleName);
            var user = this.unitOfWork.GetAccountByEmail(email);

            return user.ID == role.ID;
        }

        public override string[] GetRolesForUser(string email)
        {
            var role = new string[] { };

            var user = this.unitOfWork.GetAccountByEmail(email);
            if (user == null)
            {
                return role;
            }

            var userRole = this.unitOfWork.RoleRepository.GetByID(user.RoleID);
            if (userRole != null)
            {
                role = new[] { userRole.RoleName };
            }

            return role;
        }

        public override void CreateRole(string roleName)
        {
            var newRole = new Role { RoleName = roleName };

            this.unitOfWork.RoleRepository.Insert(newRole);
            this.unitOfWork.Save();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            var currentRole = new Role { RoleName = roleName };

            try
            {
                this.unitOfWork.RoleRepository.Delete(currentRole);
                this.unitOfWork.Save();
            }
            catch 
            {
                return false;
            }

            return true; 
        }

        public override bool RoleExists(string roleName)
        {
            return this.unitOfWork.GetRole(roleName) != null;
        }

        public override void AddUsersToRoles(string[] useremails, string[] roleNames)
        {
            foreach (var roleName in roleNames)
            {
                var role = this.unitOfWork.GetRole(roleName);

                if (role == null)
                {
                    continue;
                }

                foreach (var email in useremails)
                {
                    var currentUser = this.unitOfWork.GetAccountByEmail(email);

                    if (currentUser == null)
                    {
                        continue;
                    }

                    currentUser.ID = role.ID;
                }
            }

            this.unitOfWork.Save();
        }

        public override void RemoveUsersFromRoles(string[] useremails, string[] roleNames)
        {
            foreach (var roleName in roleNames)
            {
                var role = this.unitOfWork.GetRole(roleName);

                if (role == null)
                {
                    continue;
                }

                foreach (var email in useremails)
                {
                    var currentUser = this.unitOfWork.GetAccountByEmail(email);

                    if (currentUser == null)
                    {
                        continue;
                    }

                    currentUser.ID = 1;
                }
            }

            this.unitOfWork.Save();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            var users = new List<string>();

            var userRole = this.unitOfWork.GetRole(roleName);

            if (userRole == null)
            {
                return users.ToArray();
            }
            
            var usersInRole = this.unitOfWork.AccountRepository.Get(user => user.RoleID == userRole.ID);
            users.AddRange(usersInRole.Select(user => user.Email));
            return users.ToArray();
        }

        public override string[] GetAllRoles()
        {
            var roles = this.unitOfWork.RoleRepository.Get();
            return roles.Select(role => role.RoleName).ToArray();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            var role = this.unitOfWork.GetRole(roleName);
            var users = this.unitOfWork.AccountRepository.Get(user => user.RoleID == role.ID);
            return users.Select(user => user.Email).ToArray();
        }

        public override string ApplicationName { get; set; }

        public void Dispose()
        {
            this.unitOfWork.Dispose();
        }
    }
}