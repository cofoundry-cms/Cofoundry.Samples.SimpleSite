using Cofoundry.Core.Mail;
using Cofoundry.Core.Validation;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SimpleSite
{
    public class ContactRequestFormViewComponent : ViewComponent
    {
        private readonly IMailService _mailService;
        private readonly IModelValidationService _modelValidationService;
        private readonly SimpleTestSiteSettings _simpleTestSiteSettings;

        public ContactRequestFormViewComponent(
            IMailService mailService,
            IModelValidationService modelValidationService,
            SimpleTestSiteSettings simpleTestSiteSettings
            )
        {
            _mailService = mailService;
            _modelValidationService = modelValidationService;
            _simpleTestSiteSettings = simpleTestSiteSettings;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var contactRequest = new ContactRequest();

            // ModelBinder is not supported in view components so we have to bind
            // this manually. We have an issue open to try and improve the experience here
            // https://github.com/cofoundry-cms/cofoundry/issues/125

            if (Request.Method.Equals("POST", StringComparison.OrdinalIgnoreCase))
            {
                contactRequest.Name = Request.Form[nameof(contactRequest.Name)];
                contactRequest.EmailAddress = Request.Form[nameof(contactRequest.EmailAddress)];
                contactRequest.Message = Request.Form[nameof(contactRequest.Message)];

                ValidateModel(contactRequest);

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

        /// <summary>
        /// Because model binding isn't supported in view components, we have to 
        /// manually validate the model.
        /// </summary>
        private void ValidateModel<TModel>(TModel model)
        {
            var errors = _modelValidationService.GetErrors(model);

            foreach (var error in errors)
            {
                ModelState.AddModelError(error.Properties.FirstOrDefault(), error.Message);
            }
        }
    }
}
