using System.Web.Mvc;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;
using Paprotski.Lab3.SocialNetwork.Beta.Models;
using Paprotski.Lab3.SocialNetwork.DAL;

namespace Paprotski.Lab3.SocialNetwork.Beta.Controllers
{
    [Authorize]
    public class FriendsController : Controller
    {
        #region Fields

        private UnitOfWork unitOfWork = new UnitOfWork();

        #endregion

        #region Private Properties

        private Account CurrentUser
        {
            get
            {
                return this.unitOfWork.GetAccountByEmail(User.Identity.Name);
            }
        }

        #endregion

        #region Public Methods and Operators

        // GET: Friends
        public ActionResult Index(int? id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id) ?? this.CurrentUser;
            var friendsList = new FriendListViewModel() { Friends = account.Friends };
            return View(friendsList);
        }

        // GET: Friends/Addition/id
        public ActionResult Addition(int id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id);
            var currentUser = this.CurrentUser;

            if (account.ID == currentUser.ID)
            {
                return this.RedirectToAction("Index", "Friends", new { id });
            }
            
            if (currentUser.Friends.Contains(account))
            {
                return this.RedirectToAction("Index", "Friends", new { id });
            }

            currentUser.Friends.Add(account);

            this.unitOfWork.AccountRepository.Update(currentUser);
            this.unitOfWork.Save();

            return this.RedirectToAction("Index", "Friends", new { id });
        }

        // GET: Friends/Delete/5
        public ActionResult Delete(int id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id);
            var currentUser = this.CurrentUser;

            if (account.ID == currentUser.ID)
            {
                return this.RedirectToAction("Index", "Friends", new { id  });
            }

            if (!currentUser.Friends.Contains(account))
            {
                return this.RedirectToAction("Index", "Friends", new { id = currentUser.ID });
            }

            currentUser.Friends.Remove(account);

            this.unitOfWork.AccountRepository.Update(currentUser);
            this.unitOfWork.Save();

            return this.RedirectToAction("Index", "Friends", new { id });
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
