using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.Beta.Models
{
    public class CreatePrivateMessageViewModel
    {
        [Required]
        [DataType(DataType.MultilineText)]
        [Display(Name = "Сообщение")]
        public string Message { get; set; }

        [Display(Name = "Получатель")]
        public string ReceiverFullName { get; set; }

        [Required]
        public int ReceiverID { get; set; }
    }

    public class ViewPrivateMessageViewModel
    {
        [Required]
        [DataType(DataType.MultilineText)]
        [Display(Name = "Сообщение")]
        public string Message { get; set; }

        [Required]
        [DataType(DataType.DateTime)]
        [Display(Name = "Время отправления")]
        public DateTime DateSent { get; set; }

        [Display(Name = "Отправитель")]
        public string SenderFullName { get; set; }
    }

    public class ListPrivateMessageViewModel
    {
        public IEnumerable<PrivateMessage> SentPrivateMessages { get; set; }

        public IEnumerable<PrivateMessage> ReceiverPrivateMessages { get; set; } 
    }
}