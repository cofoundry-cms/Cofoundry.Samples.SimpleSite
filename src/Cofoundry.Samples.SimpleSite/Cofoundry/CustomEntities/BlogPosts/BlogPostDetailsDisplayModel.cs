using Cofoundry.Domain;
using Cofoundry.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// An ICustomEntityDetailsDisplayViewModel implementation is required if
    /// you want to use a page template to dynamically render a details view
    /// of a custom entity.
    /// </summary>
    public class BlogPostDetailsDisplayModel : ICustomEntityDetailsDisplayViewModel<BlogPostDataModel>
    {
        public string PageTitle { get; set; }

        public PageMetaData MetaData { get; set; }

        public string Title { get; set; }

        public DateTime Date { get; set; }

        public string FullPath { get; set; }
    }
}