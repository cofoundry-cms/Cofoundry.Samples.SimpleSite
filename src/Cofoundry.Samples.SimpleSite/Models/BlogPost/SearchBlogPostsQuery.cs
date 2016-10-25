using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    public class SearchBlogPostsQuery : SimplePageableQuery
    {
        public int CategoryId { get; set; }
    }
}