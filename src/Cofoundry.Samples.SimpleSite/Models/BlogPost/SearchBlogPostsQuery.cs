using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// Inheriting from SimplePageableQuery or IPageableQuery 
    /// gives us a few extra features when working with pages 
    /// data via the PagingExtensions set of extension methods.
    /// 
    /// See https://github.com/cofoundry-cms/cofoundry/blob/master/src/Cofoundry.Domain/Domain/Shared/Paging/PagingExtensions.cs
    /// </summary>
    public class SearchBlogPostsQuery : SimplePageableQuery
    {
        public int CategoryId { get; set; }
    }
}