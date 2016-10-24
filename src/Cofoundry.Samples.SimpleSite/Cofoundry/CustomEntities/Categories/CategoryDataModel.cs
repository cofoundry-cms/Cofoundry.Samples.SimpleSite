using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.SimpleSite
{
    public class CategoryDataModel : ICustomEntityVersionDataModel
    {
        [MaxLength(500)]
        [Display(Description = "A short description that appears as a tooltip when hovering over the category.")]
        [MultiLineText]
        public string ShortDescription { get; set; }
    }
}