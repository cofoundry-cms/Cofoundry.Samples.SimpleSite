using Cofoundry.Core.Configuration;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// Cofoundry includes a system for easily creating strongly typed configuration 
    /// settings just by defining a POCO class that inherits from IConfigurationSettings. 
    /// These settings classes are automatically picked up by the DI system and bound 
    /// to your config source (e.g. web.config/app.config) at runtime.
    /// 
    /// See https://github.com/cofoundry-cms/cofoundry/wiki/Configuration-Settings
    /// </summary>
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