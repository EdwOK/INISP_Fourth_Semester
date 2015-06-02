using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Paprotski.Lab3.SocialNetwork.Domain.Entities
{
    public class PrivateMessage
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [DataType(DataType.DateTime)]
        public DateTime DateSent { get; set; }

        [Required]
        [DataType(DataType.MultilineText)]
        public string Message { get; set; }

        [Required]
        public bool IsRead { get; set; }

        [ForeignKey("Sender")]
        public int? SenderID { get; set; }

        public virtual Account Sender { get; set; }

        [ForeignKey("Receiver")]
        public int? ReceiverID { get; set; }

        public virtual Account Receiver { get; set; }
    }
}