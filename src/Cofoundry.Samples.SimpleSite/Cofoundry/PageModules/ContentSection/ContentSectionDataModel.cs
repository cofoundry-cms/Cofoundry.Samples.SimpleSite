using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// Each module should have a data model that implements IPageModuleDataModel that 
    /// describes the data to store in the database. Data is stored in an unstructured 
    /// format (json) so simple serializable data types are best.
    /// </summary>
    public class ContentSectionDataModel : IPageModuleDataModel
    {
        [Display(Description = "Optional title to display at the top of the section")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Text", Description = "Rich text displayed at full width")]
        [Html(HtmlToolbarPreset.BasicFormatting, HtmlToolbarPreset.Headings, HtmlToolbarPreset.Media)]
        public string HtmlText { get; set; }
    }
}