using System.Data;
using System.Web.Mvc;
using System.Web.Security;
using Paprotski.Lab3.SocialNetwork.DAL;
using Paprotski.Lab3.SocialNetwork.Beta.Models;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.Beta.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        #region Fields

        private UnitOfWork unitOfWork = new UnitOfWork();

        #endregion

        #region Public Methods and Operators

        // POST: Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return this.RedirectToAction("Index", "Home");
        }

        // GET: Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            if (this.User.Identity.IsAuthenticated)
            {
                return this.RedirectToLocal(returnUrl);
            }

            this.ViewBag.ReturnUrl = returnUrl;
            return this.View();
        }

        // POST: Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View(model);
            }

            var account = this.unitOfWork.GetAccountByEmail(model.Email);

            if (account != null && model.Password == account.Password)
            {
                FormsAuthentication.SetAuthCookie(model.Email, model.RememberMe);
                return this.RedirectToLocal(returnUrl);
            }

            this.ModelState.AddModelError("", "Неудачная попытка входа.");

            return this.View(model);
        }

        // GET: Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            if (this.User.Identity.IsAuthenticated)
            {
                return this.RedirectToAction("Index", "Home");
            }

            return this.View();
        }

        // POST: Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterViewModel model)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View(model);
            }

            var account = this.unitOfWork.GetAccountByEmail(model.Email);

            if (account == null)
            {
                try
                {
                    this.unitOfWork.AccountRepository.Insert(
                        new Account
                            {
                                FirstName = model.FirstName,
                                LastName = model.LastName,
                                Gender = model.Gender,
                                Birthday = model.Birthday,
                                Email = model.Email,
                                Password = model.Password,
                                RoleID = 1
                            });

                    this.unitOfWork.Save();
                }
                catch (DataException exception)
                {
                    this.ModelState.AddModelError("", exception.Message);

                    return this.View(model);
                }

                account = this.unitOfWork.GetAccountByEmail(model.Email);

                if (account == null)
                {
                    return this.View(model);
                }

                FormsAuthentication.SetAuthCookie(model.Email, false);
                return this.RedirectToAction("Index", "Home");
            }

            this.ModelState.AddModelError("", "Аккаунт уже существует.");
            return View(model);
        }

        #endregion

        #region Methods

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (this.Url.IsLocalUrl(returnUrl))
            {
                return this.Redirect(returnUrl);
            }

            return this.RedirectToAction("Index", "Home");
        }

        protected override void Dispose(bool disposing)
        {
            this.unitOfWork.Dispose();
            base.Dispose(disposing);
        }

        #endregion
    }
}