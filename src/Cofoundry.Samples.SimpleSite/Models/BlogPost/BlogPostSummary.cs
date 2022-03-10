using Cofoundry.Domain;
using System;

namespace Cofoundry.Samples.SimpleSite
{
    public class BlogPostSummary
    {
        public string Title { get; set; }

        public string ShortDescription { get; set; }

        public string AuthorName { get; set; }

        public ImageAssetRenderDetails ThumbnailImageAsset { get; set; }

        public string FullPath { get; set; }

        public DateTime? PostDate { get; set; }
    }
}