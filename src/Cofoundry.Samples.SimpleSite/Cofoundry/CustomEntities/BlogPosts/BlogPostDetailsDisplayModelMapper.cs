using Cofoundry.Domain;
using Cofoundry.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    public class BlogPostDetailsDetailsDisplayModelMapper : ICustomEntityDetailsDisplayModelMapper<BlogPostDataModel, BlogPostDetailsDisplayModel>
    {
        public BlogPostDetailsDisplayModel MapDetails(CustomEntityRenderDetails renderDetails, BlogPostDataModel dataModel)
        {
            var vm = new BlogPostDetailsDisplayModel();

            vm.MetaData = new PageMetaData() { Description = dataModel.ShortDescription };
            vm.PageTitle = renderDetails.Title;
            vm.Title = renderDetails.Title;
            vm.Date = renderDetails.CreateDate;
            vm.FullPath = renderDetails.DetailsPageUrls.FirstOrDefault();

            return vm;
        }
    }
}