using Cofoundry.Domain;
using Microsoft.AspNetCore.Html;

namespace Cofoundry.Samples.SimpleSite
{
    public class AuthorDetails
    {
        public string Name { get; set; }

        public IHtmlContent Biography { get; set; }

        public ImageAssetRenderDetails ProfileImage { get; set; }
    }
}
