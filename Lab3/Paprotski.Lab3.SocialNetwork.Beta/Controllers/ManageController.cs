using System.Web.Mvc;
using Paprotski.Lab3.SocialNetwork.Beta.Models;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;
using Paprotski.Lab3.SocialNetwork.DAL;

namespace Paprotski.Lab3.SocialNetwork.Beta.Controllers
{
    [Authorize]
    public class ManageController : Controller
    {
        #region Fields

        private UnitOfWork unitOfWork = new UnitOfWork();

        #endregion

        #region Enums

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            Error
        }

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

        //
        // GET: /Manage/Index
        public ActionResult Index(ManageMessageId? message)
        {
            this.ViewBag.StatusMessage = message == ManageMessageId.ChangePasswordSuccess
                                             ? "Ваш пароль изменен."
                                             : message == ManageMessageId.Error ? "Произошла ошибка." : "";

            var account = this.CurrentUser;
            IndexViewModel model = null;

            if (account != null)
            {
                model = new IndexViewModel
                            {
                                FirstName = account.FirstName,
                                LastName = account.LastName,
                                Gender = account.Gender,
                                Birthday = account.Birthday
                            };
            }
            else
            {
                this.ModelState.AddModelError("", "Произошла ошибка либо аккаунт удалён.");
            }

            return this.View(model);
        }

        //
        // POST: /Manage/Index
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(IndexViewModel model)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View(model);
            }

            var account = this.CurrentUser;

            if (account != null)
            {
                account.FirstName = model.FirstName;
                account.LastName = model.LastName;
                account.Birthday = model.Birthday;
                account.Gender = model.Gender;

                this.unitOfWork.AccountRepository.Update(account);
                this.unitOfWork.Save();
            }
            else
            {
                this.ModelState.AddModelError("", "Произошла ошибка либо аккаунт удалён.");
            }

            return this.View(model);
        }

        //
        // GET: /Manage/ChangePassword
        public ActionResult ChangePassword()
        {
            return this.View();
        }

        //
        // POST: /Manage/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(ChangePasswordViewModel model)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View(model);
            }

            var account = this.CurrentUser;

            if (model.OldPassword != account.Password)
            {
                this.ModelState.AddModelError("", "Неправильный текущий пароль.");
            }
            else
            {
                if (account == null)
                {
                    return this.View(model);
                }

                account.Password = model.NewPassword;

                this.unitOfWork.AccountRepository.Update(account);
                this.unitOfWork.Save();

                return this.RedirectToAction("Index", new { Message = ManageMessageId.ChangePasswordSuccess });
            }

            return this.View(model);
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