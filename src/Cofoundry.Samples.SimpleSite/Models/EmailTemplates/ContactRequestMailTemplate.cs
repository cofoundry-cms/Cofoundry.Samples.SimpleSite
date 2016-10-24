using Cofoundry.Core.Mail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
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