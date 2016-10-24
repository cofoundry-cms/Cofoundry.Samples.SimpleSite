using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using Cofoundry.Core;
using Cofoundry.Core.Mail;

namespace Cofoundry.Samples.SimpleSite
{
    [RoutePrefix("Contact")]
    [Route("{action}")]
    public class ContactController : Controller
    {
        private readonly IMailService _mailService;
        private readonly SimpleTestSiteSettings _simpleTestSiteSettings;

        public ContactController(
            IMailService mailService,
            SimpleTestSiteSettings simpleTestSiteSettings
            )
        {
            _mailService = mailService;
            _simpleTestSiteSettings = simpleTestSiteSettings;
        }

        [ChildActionOnly]
        public ActionResult ContactRequestForm()
        {
            var viewModel = new ContactRequest();

            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ContactRequestForm(ContactRequest contactRequest)
        {
            if (ModelState.IsValid)
            {
                // Send admin confirmation
                var template = new ContactRequestMailTemplate();
                template.Request = contactRequest;

                _mailService.Send(_simpleTestSiteSettings.ContactRequestNotificationToAddress, template);

                return View("ContactSuccess");
            }

            return View(contactRequest);
        }
    }
}