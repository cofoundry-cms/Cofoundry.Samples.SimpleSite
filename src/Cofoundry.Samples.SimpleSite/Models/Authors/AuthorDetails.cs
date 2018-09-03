using Cofoundry.Domain;
using Microsoft.AspNetCore.Html;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SimpleSite
{
    public class AuthorDetails
    {
        public string Name { get; set; }

        public IHtmlContent Biography { get; set; }

        public ImageAssetRenderDetails ProfileImage { get; set; }
    }
}
