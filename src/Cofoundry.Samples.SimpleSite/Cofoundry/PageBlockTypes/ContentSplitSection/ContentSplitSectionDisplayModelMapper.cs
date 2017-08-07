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
    public class ContentSplitSectionDisplayModelMapper : IPageBlockDisplayModelMapper<ContentSplitSectionDataModel>
    {
        private readonly IImageAssetRepository _imageAssetRepository;

        public ContentSplitSectionDisplayModelMapper(
            IImageAssetRepository imageAssetRepository
            )
        {
            _imageAssetRepository = imageAssetRepository;
        }

        public async Task<IEnumerable<PageBlockDisplayModelMapperOutput>> MapAsync(
            IEnumerable<PageBlockDisplayModelMapperInput<ContentSplitSectionDataModel>> inputs, 
            WorkFlowStatusQuery workflowStatus
            )
        {
            // Because mapping is done in batch, we have to map multiple images here
            // Fortunately Cofoundry gives us access to repositories that can fetch this data
            // for us

            var imageAssetIds = inputs
                .Select(i => i.DataModel.ImageAssetId)
                .Distinct();

            var imageAssets = await _imageAssetRepository.GetImageAssetRenderDetailsByIdRangeAsync(imageAssetIds);

            var results = new List<PageBlockDisplayModelMapperOutput>();

            foreach (var input in inputs)
            {
                var output = new ContentSplitSectionDisplayModel();
                output.HtmlText = new HtmlString(input.DataModel.HtmlText);
                output.Title = input.DataModel.Title;
                output.Image = imageAssets.GetOrDefault(input.DataModel.ImageAssetId);

                results.Add(input.CreateOutput(output));
            }

            return results;
        }
    }
}