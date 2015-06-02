using System;
using System.Linq;
using System.Web.Mvc;
using Paprotski.Lab3.SocialNetwork.DAL;
using Paprotski.Lab3.SocialNetwork.Beta.Models;
using Paprotski.Lab3.SocialNetwork.Domain.Entities;

namespace Paprotski.Lab3.SocialNetwork.Beta.Controllers
{
    [Authorize]
    public class PrivateMessageController : Controller
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

        // GET: PrivateMessage
        public ActionResult Index()
        {
            var privateMessageReceiverList =
                this.unitOfWork.PrivateMessageRepository.Get(pm => pm.ReceiverID == this.CurrentUser.ID)
                    .OrderByDescending(pm => pm.DateSent)
                    .ToList();

            var privateMesssageSentList =
                this.unitOfWork.PrivateMessageRepository.Get(pm => pm.SenderID == this.CurrentUser.ID)
                    .OrderByDescending(pm => pm.DateSent)
                    .ToList();

            var model = new ListPrivateMessageViewModel()
                            {
                                ReceiverPrivateMessages = privateMessageReceiverList,
                                SentPrivateMessages = privateMesssageSentList
                            };

            return this.View(model);
        }

        // GET: PrivateMessage/Details/id
        public ActionResult Details(int id)
        {
            var message = this.unitOfWork.PrivateMessageRepository.GetByID(id);

            if (message == null)
            {
                return this.RedirectToAction("Index", "PrivateMessage");
            }

            var model = new ViewPrivateMessageViewModel
                            {
                                DateSent = message.DateSent,
                                Message = message.Message,
                                SenderFullName =
                                    string.Concat(
                                        message.Sender.FirstName,
                                        " ",
                                        message.Sender.LastName)
                            };

            if (message.SenderID == this.CurrentUser.ID && message.ReceiverID != this.CurrentUser.ID)
            {
                return this.View(model);
            }

            message.IsRead = true;
            this.unitOfWork.PrivateMessageRepository.Update(message);
            this.unitOfWork.Save();

            return this.View(model);
        }

        // GET: PrivateMessage/Create/id
        public ActionResult Create(int id)
        {
            var receiver = this.unitOfWork.AccountRepository.GetByID(id);

            if (receiver == null)
            {
                return this.RedirectToAction("Index", "Profile");
            }

            var model = new CreatePrivateMessageViewModel
                            {
                                ReceiverID = receiver.ID,
                                ReceiverFullName =
                                    string.Concat(
                                        receiver.FirstName,
                                        " ",
                                        receiver.LastName),
                                Message = ""
                            };

            return this.View(model);
        }

        // POST: PrivateMessage/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CreatePrivateMessageViewModel model)
        {
            if (!this.ModelState.IsValid)
            {
                return this.RedirectToAction("Create", "PrivateMessage", new { id = model.ReceiverID });
            }

            var privateMessage = new PrivateMessage
            {
                DateSent = DateTime.Now,
                IsRead = false,
                Message = model.Message,
                ReceiverID = model.ReceiverID,
                SenderID = this.CurrentUser.ID
            };

            this.unitOfWork.PrivateMessageRepository.Insert(privateMessage);
            this.unitOfWork.Save();

            return this.RedirectToAction("Index", "Profile", new { id = model.ReceiverID });
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
