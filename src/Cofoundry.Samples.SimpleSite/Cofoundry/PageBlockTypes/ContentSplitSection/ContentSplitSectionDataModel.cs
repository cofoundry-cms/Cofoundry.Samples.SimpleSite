using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// Each block type should have a data model that implements IPageBlockTypeDataModel that 
    /// describes the data to store in the database. Data is stored in an unstructured 
    /// format (json) so simple serializable data types are best.
    /// 
    /// Attributes can be used to describe validations as well as hints to the 
    /// content editor UI on how to render the data input controls.
    /// 
    /// See https://github.com/cofoundry-cms/cofoundry/wiki/Page-Block-Types
    /// for more information
    /// </summary>
    public class ContentSplitSectionDataModel : IPageBlockTypeDataModel
    {
        [Display(Description = "Optional title to display at the top of the section")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Text", Description = "Rich text displayed alongside the image")]
        [Html(HtmlToolbarPreset.BasicFormatting, HtmlToolbarPreset.Headings)]
        public string HtmlText { get; set; }

        [Display(Description = "Image to display alongside the text")]
        [Image(MinWidth = 400, MinHeight = 400)]
        public int ImageAssetId { get; set; }
    }
}