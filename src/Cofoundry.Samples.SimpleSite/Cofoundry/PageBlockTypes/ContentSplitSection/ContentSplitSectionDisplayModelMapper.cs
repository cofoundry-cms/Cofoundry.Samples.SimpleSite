using Cofoundry.Core;
using Cofoundry.Domain;
using Microsoft.AspNetCore.Html;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// A IPageBlockDisplayModelMapper class handles the mapping from
    /// a display model to a data model.
    /// 
    /// The mapper supports DI which gives you flexibility in what data
    /// you want to include in the display model and how you want to 
    /// map it. Mapping is done in batch to improve performance when 
    /// the same block type is used multiple times on a page.
    /// </summary>
    public class ContentSplitSectionDisplayModelMapper : IPageBlockTypeDisplayModelMapper<ContentSplitSectionDataModel>
    {
        private readonly IContentRepository _contentRepository;

        public ContentSplitSectionDisplayModelMapper(
            IContentRepository contentRepository
            )
        {
            _contentRepository = contentRepository;
        }

        public async Task MapAsync(
            PageBlockTypeDisplayModelMapperContext<ContentSplitSectionDataModel> context,
            PageBlockTypeDisplayModelMapperResult<ContentSplitSectionDataModel> result
            )
        {
            // Because mapping is done in batch, we have to map multiple images here
            // The Cofoundry IContentRepository gives us an easy to use data access api.
            // for us
            var imageAssetIds = context.Items.SelectDistinctModelValuesWithoutEmpty(i => i.ImageAssetId);
            var imageAssets = await _contentRepository
                .WithExecutionContext(context.ExecutionContext)
                .ImageAssets()
                .GetByIdRange(imageAssetIds)
                .AsRenderDetails()
                .ExecuteAsync();

            foreach (var item in context.Items)
            {
                var displayModel = new ContentSplitSectionDisplayModel();
                displayModel.HtmlText = new HtmlString(item.DataModel.HtmlText);
                displayModel.Title = item.DataModel.Title;
                displayModel.Image = imageAssets.GetOrDefault(item.DataModel.ImageAssetId);

                result.Add(item, displayModel);
            }
        }
    }
}