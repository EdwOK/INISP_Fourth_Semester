using System.Web.Mvc;
using Paprotski.Lab3.SocialNetwork.Beta.Models;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;
using Paprotski.Lab3.SocialNetwork.DAL;

namespace Paprotski.Lab3.SocialNetwork.Beta.Controllers
{
    [Authorize(Roles = "Администратор")]
    public class AdminController : Controller
    {
        #region Fields

        private UnitOfWork unitOfWork = new UnitOfWork();

        #endregion

        // GET: Admin
        public ActionResult Index()
        {
            var accounts = new AdminViewModels { Accounts = this.unitOfWork.AccountRepository.Get() };
            return View(accounts);
        }

        // GET: Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(AccountChangeViewModel model)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View(model);
            }

            var currentAccount = this.unitOfWork.GetAccountByEmail(model.Email);

            if (currentAccount != null)
            {
                this.ModelState.AddModelError("", "Аккаунт уже создан.");
                return this.View(model);
            }

            this.unitOfWork.AccountRepository.Insert(
                new Account
                {
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    Gender = model.Gender,
                    Birthday = model.Birthday,
                    Email = model.Email,
                    Password = model.Password,
                    RoleID = this.unitOfWork.GetRole(model.Role).ID
                });

            this.unitOfWork.Save();

            return this.RedirectToAction("Index", "Admin");
        }

        // GET: Admin/Edit/id
        public ActionResult Edit(int id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id);

            if (account == null)
            {
                return this.RedirectToAction("Index", "Admin");
            }

            var roleName = this.unitOfWork.RoleRepository.GetByID(account.RoleID);

            var model = new AccountChangeViewModel
                            {
                                FirstName = account.FirstName,
                                LastName = account.LastName,
                                Gender = account.Gender,
                                Birthday = account.Birthday,
                                Email = account.Email,
                                Password = account.Password,
                                Role = roleName.RoleName
                            };

            return this.View(model);
        }

        // POST: Admin/Edit/id
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(AccountChangeViewModel model)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View(model);
            }

            var account = this.unitOfWork.GetAccountByEmail(model.Email);

            if (account == null)
            {
                return this.RedirectToAction("Index", "Admin");
            }

            account.FirstName = model.FirstName;
            account.LastName = model.LastName;
            account.Gender = model.Gender;
            account.Birthday = model.Birthday;
            account.Password = model.Password;
            account.Email = model.Email;
            account.RoleID = this.unitOfWork.GetRole(model.Role).ID;

            this.unitOfWork.AccountRepository.Update(account);
            this.unitOfWork.Save();

            return this.RedirectToAction("Index", "Admin");
        }

        // GET: Admin/Delete/id
        public ActionResult Delete(int id)
        {
            var account = this.unitOfWork.AccountRepository.GetByID(id);

            if (account != null)
            {
                this.unitOfWork.AccountRepository.Delete(account);
                this.unitOfWork.Save();
            }

            return this.RedirectToAction("Index", "Admin");
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
