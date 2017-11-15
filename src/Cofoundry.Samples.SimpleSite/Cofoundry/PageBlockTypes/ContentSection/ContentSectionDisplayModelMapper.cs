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
    /// the same block type is used multiple times on a page
    /// </summary>
    public class ContentSectionDisplayModelMapper : IPageBlockTypeDisplayModelMapper<ContentSectionDataModel>
    {
        public Task<IEnumerable<PageBlockTypeDisplayModelMapperOutput>> MapAsync(
            IEnumerable<PageBlockTypeDisplayModelMapperInput<ContentSectionDataModel>> inputs, 
            PublishStatusQuery publishStatus
            )
        {
            var results = new List<PageBlockTypeDisplayModelMapperOutput>();

            foreach (var input in inputs)
            {
                var output = new ContentSectionDisplayModel();
                output.HtmlText = new HtmlString(input.DataModel.HtmlText);
                output.Title = input.DataModel.Title;

                // The CreateOutput() method wraps the mapped display 
                // model with it's identifier so we can identify later on
                results.Add(input.CreateOutput(output));
            }

            return Task.FromResult(results.AsEnumerable());

        }
    }
}