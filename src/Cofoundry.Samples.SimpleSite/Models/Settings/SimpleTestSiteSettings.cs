using Cofoundry.Core.Configuration;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    public class SimpleTestSiteSettings : IConfigurationSettings
    {
        /// <summary>
        /// Setting Name = SimpleTestSite:ContactRequestNotificationToAddress
        /// </summary>
        [Required]
        [EmailAddress]
        public string ContactRequestNotificationToAddress { get; set; }
    }
}