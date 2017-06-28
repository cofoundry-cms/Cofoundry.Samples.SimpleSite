using Cofoundry.Core.Mail;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// Cofoundry includes a framework for sending mail based around template
    /// classes and view files rendered using RazorEngine.
    /// 
    /// For more information see https://github.com/cofoundry-cms/cofoundry/wiki/Mail
    /// </summary>
    public class ContactRequestMailTemplate : IMailTemplate
    {
        public string ViewFile
        {
            get
            {
                return "~/Views/EmailTemplates/ContactRequest";
            }
        }

        public string Subject
        {
            get
            {
                return "New Contact Request";
            }
        }

        public ContactRequest Request { get; set; }
    }
}