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
    /// <summary>
    /// There's no built in contact form in Cofoundry, but we
    /// don't obstruct you from using the full asp.net framework
    /// so it's pretty easy to just use the raw framework to add 
    /// this feature. 
    /// 
    /// In this case we use the Cofoundry IMailService to send a simple
    /// notification. See https://github.com/cofoundry-cms/cofoundry/wiki/Mail
    /// </summary>
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
            // Note that strongly typed configuration settings are
            // injected by Cofoundry - see https://github.com/cofoundry-cms/cofoundry/wiki/Configuration-Settings
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