using Cofoundry.Web.ModularMvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace Cofoundry.Samples.SimpleSite
{
    /// <remarks>
    /// A bundle registration is a simple convention for defining Bundles. It will automatically be 
    /// run at startup as part of the Cofoundry startup.
    /// </remarks>
    public class BundleRegistration : IBundleRegistration
    {
        public void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/Content/bundles/scripts")
                .Include("~/js/bootstrap.min.js")
                );

            bundles.Add(new StyleBundle("~/Content/bundles/css")
                .Include("~/Content/css/bootstrap.min.css")
                .Include("~/Content/css/style.css")
                );
        }
    }
}