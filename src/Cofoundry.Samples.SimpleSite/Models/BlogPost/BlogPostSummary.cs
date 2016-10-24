using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    public class BlogPostSummary
    {
        public string Title { get; set; }

        public string ShortDescription { get; set; }

        public ImageAssetRenderDetails ThumbnailImageAsset { get; set; }

        public string FullPath { get; set; }

        public DateTime PostDate { get; set; }
    }
}