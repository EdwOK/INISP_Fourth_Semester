using System.Web.Mvc;
using Paprotski.Lab3.SocialNetwork.Beta.Models;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;
using Paprotski.Lab3.SocialNetwork.DAL;

namespace Paprotski.Lab3.SocialNetwork.Beta.Controllers
{
    [Authorize]
    public class ProfileController : Controller
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

        // GET: Profile/Index
        public ActionResult Index(int? id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id) ?? this.CurrentUser;

            var model = new ProfileViewModel()
                            {
                                ID = account.ID,
                                FirstName = account.FirstName,
                                LastName = account.LastName,
                                Gender = account.Gender,
                                Birthday = account.Birthday,
                                Email = account.Email
                            };

            return this.View(model);
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
