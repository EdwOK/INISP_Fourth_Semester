using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Net;
using System.Web.Http;
using System.Web.Http.Description;
using Paprotski.Lab3.SocialNetwork.DAL;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.Beta.API
{
    public class AccountController : ApiController
    {
        #region Fields

        private UnitOfWork unitOfWork = new UnitOfWork();

        #endregion

        // GET: api/account
        public IEnumerable<Account> GetAccounts()
        {
            return this.unitOfWork.AccountRepository.Get();
        }

        // GET: api/account/5
        [ResponseType(typeof(Account))]
        public IHttpActionResult GetAccount(int id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id);

            if (account == null)
            {
                return NotFound();
            }

            return Ok(account);
        }

        // PUT: api/account/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAccount(int id, Account account)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != account.ID)
            {
                return BadRequest();
            }

            this.unitOfWork.AccountRepository.Update(account);

            try
            {
                this.unitOfWork.Save();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (this.unitOfWork.AccountRepository.GetByID(account.ID) == null)
                {
                    return NotFound();
                }
                throw;
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/account
        [ResponseType(typeof(Account))]
        public IHttpActionResult PostAccount(Account account)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (account == null)
            {
                return BadRequest(ModelState);
            }

            this.unitOfWork.AccountRepository.Insert(account);
            this.unitOfWork.Save();

            return CreatedAtRoute("DefaultApi", new { id = account.ID }, account);
        }

        // DELETE: api/account/5
        [ResponseType(typeof(Account))]
        public IHttpActionResult DeleteAccount(int id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id);

            if (account == null)
            {
                return NotFound();
            }

            this.unitOfWork.AccountRepository.Delete(id);
            this.unitOfWork.Save();

            return Ok(account);
        }

        #region Methods

        protected override void Dispose(bool disposing)
        {
            this.unitOfWork.Dispose();
            base.Dispose(disposing);
        }

        #endregion
    }
}