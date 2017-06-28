using Cofoundry.Core.Mail;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SimpleSite
{
    public class ContactRequestFormViewComponent : ViewComponent
    {
        private readonly IMailService _mailService;
        private readonly SimpleTestSiteSettings _simpleTestSiteSettings;

        public ContactRequestFormViewComponent(
            IMailService mailService,
            SimpleTestSiteSettings simpleTestSiteSettings
            )
        {
            _mailService = mailService;
            _simpleTestSiteSettings = simpleTestSiteSettings;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var contactRequest = new ContactRequest();

            if (Request.Method.Equals("POST", StringComparison.OrdinalIgnoreCase))
            {
                contactRequest.Name = Request.Form[nameof(contactRequest.Name)];
                contactRequest.EmailAddress = Request.Form[nameof(contactRequest.EmailAddress)];
                contactRequest.Message = Request.Form[nameof(contactRequest.Message)];
                
                
                // TODO: Update model binding, Validate model
                if (ModelState.IsValid)
                {
                    // Send admin confirmation
                    var template = new ContactRequestMailTemplate();
                    template.Request = contactRequest;
                    await _mailService.SendAsync(_simpleTestSiteSettings.ContactRequestNotificationToAddress, template);

                    return View("ContactSuccess");
                }
            }

            return View(contactRequest);
        }

    }
}
