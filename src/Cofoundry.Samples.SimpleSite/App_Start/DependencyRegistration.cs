using Cofoundry.Core.Configuration;
using Cofoundry.Core.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    public class DependencyRegistration : IDependencyRegistration
    {
        public void Register(IContainerRegister container)
        {
            container.RegisterFactory<SimpleTestSiteSettings, ConfigurationSettingsFactory<SimpleTestSiteSettings>>();
        }
    }
}