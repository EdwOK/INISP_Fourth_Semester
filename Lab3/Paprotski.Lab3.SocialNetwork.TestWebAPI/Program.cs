using System.Net.Http;
using System;
using System.Collections.Generic;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.TestWebAPI
{
    class Program
    {
        private static readonly HttpClient Client = new HttpClient();
        
        static void Main(string[] args)
        {
            Client.BaseAddress = new Uri("http://localhost/SocialNetwork/");

            Console.WriteLine("Accounts List");
            ListAllAccounts();

            Console.ReadKey();
        }

        static void ListAllAccounts()
        {
            var result = Client.GetAsync("api/account").Result;
            result.EnsureSuccessStatusCode();

            var accounts = result.Content.ReadAsAsync<IEnumerable<Account>>().Result;

            foreach (var account in accounts)
            {
                Console.WriteLine(
                    "{0} {1} {2} {3} {4} {5} {6}",
                    account.ID,
                    account.FirstName,
                    account.LastName,
                    account.Gender,
                    account.Email,
                    account.Password,
                    account.RoleID);
            }
        }
    }
}
