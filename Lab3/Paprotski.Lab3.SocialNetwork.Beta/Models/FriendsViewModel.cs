using System;
using System.Collections.Generic;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.Beta.Models
{
    public class FriendListViewModel
    {
        public IEnumerable<Account> Friends { get; set; }
    }
}