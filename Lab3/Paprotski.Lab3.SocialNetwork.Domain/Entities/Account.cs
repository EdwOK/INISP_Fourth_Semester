using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Paprotski.Lab3.SocialNetwork.Domain.Entities
{
    public class Account
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime Birthday { get; set; }

        [Required]
        public string Gender { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public int? RoleID { get; set; }

        public virtual ICollection<Account> Friends { get; set; }

        public Role Role { get; set; }
    }

    public class Role
    {
        public int ID { get; set; }

        public string RoleName { get; set; }
    }
}