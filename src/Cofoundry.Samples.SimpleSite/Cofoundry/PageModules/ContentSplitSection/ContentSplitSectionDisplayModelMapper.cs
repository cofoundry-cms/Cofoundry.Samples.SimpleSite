using Cofoundry.Core;
using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    public class ContentSplitSectionDisplayModelMapper : IPageModuleDisplayModelMapper<ContentSplitSectionDataModel>
    {
        private readonly IImageAssetRepository _imageAssetRepository;

        public ContentSplitSectionDisplayModelMapper(
            IImageAssetRepository imageAssetRepository
            )
        {
            _imageAssetRepository = imageAssetRepository;
        }

        public IEnumerable<PageModuleDisplayModelMapperOutput> Map(
            IEnumerable<PageModuleDisplayModelMapperInput<ContentSplitSectionDataModel>> inputs, 
            WorkFlowStatusQuery workflowStatus
            )
        {
            var imageAssetIds = inputs
                .Select(i => i.DataModel.ImageAssetId)
                .Distinct();

            var imageAssets = _imageAssetRepository.GetImageAssetRenderDetailsByIdRange(imageAssetIds);

            foreach (var input in inputs)
            {
                var output = new ContentSplitSectionDisplayModel();
                output.HtmlText = new HtmlString(input.DataModel.HtmlText);
                output.Title = input.DataModel.Title;
                output.Image = imageAssets.GetOrDefault(input.DataModel.ImageAssetId);

                yield return input.CreateOutput(output);
            }
        }
    }
}