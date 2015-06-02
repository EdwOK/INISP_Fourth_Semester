using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.Beta.Models
{
    public class AdminViewModels
    {
        public IEnumerable<Account> Accounts { get; set; }
    }

    public class AccountChangeViewModel : IDisposable
    {
        [Required]
        [Display(Name = "Имя")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Фамилия")]
        public string LastName { get; set; }

        [Required]
        [Display(Name = "Пол")]
        public string Gender { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Дата рождения")]
        public DateTime Birthday { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Адрес электронной почты")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Пароль")]
        public string Password { get; set; }

        [Required]
        [Display(Name = "Роль")]
        public string Role { get; set; }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}