using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// A IPageModuleDisplayModelMapper class handles the mapping from
    /// a display model to a data model.
    /// 
    /// The mapper supports DI which gives you flexibility in what data
    /// you want to include in the display model and how you want to 
    /// map it. Mapping is done in batch to improve performance when 
    /// the same module type is used multiple times on a page
    /// </summary>
    public class ContentSectionDisplayModelMapper : IPageModuleDisplayModelMapper<ContentSectionDataModel>
    {
        public IEnumerable<PageModuleDisplayModelMapperOutput> Map(
            IEnumerable<PageModuleDisplayModelMapperInput<ContentSectionDataModel>> inputs, 
            WorkFlowStatusQuery workflowStatus
            )
        {
            foreach (var input in inputs)
            {
                var output = new ContentSectionDisplayModel();
                output.HtmlText = new HtmlString(input.DataModel.HtmlText);
                output.Title = input.DataModel.Title;

                // The CreateOutput() method wraps the mapped display 
                // model with it's identifier so we can identify later on
                yield return input.CreateOutput(output);
            }
        }
    }
}