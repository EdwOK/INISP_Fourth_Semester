using System.Collections.Generic;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;
using System.Web.Http;
using Paprotski.Lab3.SocialNetwork.DAL;

namespace Paprotski.Lab3.SocialNetwork.Beta.Controllers
{
    public class SearchController : ApiController
    {
        #region Fields

        private UnitOfWork unitOfWork = new UnitOfWork();

        #endregion

        #region Public Methods and Operators

        // GET: api/Search
        public IEnumerable<Account> GetAllUsers()
        {
            return this.unitOfWork.AccountRepository.Get();
        }

        // GET: api/Search/Name
        public IHttpActionResult GetUser(string searchName)
        {
            var searchInput = searchName.Split(' ');

            var account = this.unitOfWork.GetAccountByFullName(
                searchInput[0],
                searchInput.Length == 2 ? searchInput[1] : null);

            if (account == null)
            {
                return this.NotFound();
            }

            return this.Json(account);
        }

        // GET: api/Search/Id
        public IHttpActionResult GetUserByID(int id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id);

            if (account == null)
            {
                return this.NotFound();
            }

            return this.Json(account);
        }

        #endregion

        #region Methods

        protected override void Dispose(bool disposing)
        {
            this.unitOfWork.Dispose();
            base.Dispose(disposing);
        }

        #endregion
    }
}
