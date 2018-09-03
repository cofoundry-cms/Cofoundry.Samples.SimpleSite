using Cofoundry.Domain;
using Cofoundry.Web;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SimpleSite
{
    public class SidebarCategoriesViewComponent : ViewComponent
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IVisualEditorStateService _visualEditorStateService;

        public SidebarCategoriesViewComponent(
            ICustomEntityRepository customEntityRepository,
            IVisualEditorStateService visualEditorStateService
            )
        {
            _customEntityRepository = customEntityRepository;
            _visualEditorStateService = visualEditorStateService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            // We can use the current visual editor state (e.g. edit mode, live mode) to
            // determine whether to show unpublished categories in the list.
            var visualEditorState = await _visualEditorStateService.GetCurrentAsync();

            var query = new SearchCustomEntityRenderSummariesQuery()
            {
                CustomEntityDefinitionCode = CategoryCustomEntityDefinition.DefinitionCode,
                PageSize = 20,
                PublishStatus = visualEditorState.GetAmbientEntityPublishStatusQuery()
            };

            var entities = await _customEntityRepository.SearchCustomEntityRenderSummariesAsync(query);
            var viewModel = MapCategories(entities);

            return View(viewModel);
        }

        private ICollection<CategorySummary> MapCategories(PagedQueryResult<CustomEntityRenderSummary> customEntityResult)
        {
            var categories = new List<CategorySummary>(customEntityResult.Items.Count());

            foreach (var customEntity in customEntityResult.Items)
            {
                var model = (CategoryDataModel)customEntity.Model;

                var category = new CategorySummary();
                category.CategoryId = customEntity.CustomEntityId;
                category.Title = customEntity.Title;
                category.ShortDescription = model.ShortDescription;

                categories.Add(category);
            }

            return categories;
        }
    }
}
