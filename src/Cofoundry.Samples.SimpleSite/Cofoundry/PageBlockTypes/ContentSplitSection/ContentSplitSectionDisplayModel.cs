using Microsoft.AspNetCore.Html;

namespace Cofoundry.Samples.SimpleSite;

/// <summary>
/// Each blcck type must have a display model that is marked with
/// IPageBlockTypeDisplayModel. This is the model that is rendered 
/// in the view. In simple scenarios you can simply mark up the data 
/// model as the display model, but here we want to transform the 
/// HtmlText property so we need to define a separate model.
/// 
/// See https://www.cofoundry.org/docs/content-management/page-block-types
/// for more information
/// </summary>
public class ContentSplitSectionDisplayModel : IPageBlockTypeDisplayModel
{
    public required string? Title { get; set; }

    public required IHtmlContent HtmlText { get; set; }

    public required ImageAssetRenderDetails? Image { get; set; }
}
