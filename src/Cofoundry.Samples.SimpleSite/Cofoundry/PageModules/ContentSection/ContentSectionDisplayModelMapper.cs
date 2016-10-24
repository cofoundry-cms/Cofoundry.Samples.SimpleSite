using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
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

                yield return input.CreateOutput(output);
            }
        }
    }
}