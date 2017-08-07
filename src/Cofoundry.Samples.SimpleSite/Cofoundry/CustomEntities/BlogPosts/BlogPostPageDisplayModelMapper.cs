using Cofoundry.Core;
using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// This mapper is required to map from the data returned from the database to
    /// a strongly typed model that we can use in the view template. This might seem
    /// a little verbose but this allows us to use a strongly typed model in the view
    /// and provides us with a lot of flexibility when mapping from unstructured data
    /// </summary>
    public class BlogPostPageDisplayModelMapper 
        : ICustomEntityDisplayModelMapper<BlogPostDataModel, BlogPostPageDisplayModel>
    {
        private readonly ICustomEntityRepository _customEntityRepository;

        public BlogPostPageDisplayModelMapper(
            ICustomEntityRepository customEntityRepository
            )
        {
            _customEntityRepository = customEntityRepository;
        }

        public async Task<BlogPostPageDisplayModel> MapDisplayModelAsync(CustomEntityRenderDetails renderDetails, BlogPostDataModel dataModel)
        {
            var vm = new BlogPostPageDisplayModel();

            vm.MetaDescription = dataModel.ShortDescription;
            vm.PageTitle = renderDetails.Title;
            vm.Title = renderDetails.Title;
            vm.Date = renderDetails.CreateDate;
            vm.FullPath = renderDetails.PageUrls.FirstOrDefault();

            if (!EnumerableHelper.IsNullOrEmpty(dataModel.CategoryIds))
            {
                // We manually query and map relations which gives us maximum flexibility when mapping models
                // Fortunately the framework provides tools to make this fairly simple
                var categoriesQuery = new GetCustomEntityRenderSummariesByIdRangeQuery(dataModel.CategoryIds);
                var results = await _customEntityRepository.GetCustomEntityRenderSummariesByIdRangeAsync(categoriesQuery);
                vm.Categories = results
                    .ToFilteredAndOrderedCollection(dataModel.CategoryIds)
                    .Select(c => MapCategory(c))
                    .ToList();
            }

            return vm;
        }

        /// <summary>
        /// We could use AutoMapper here, but to keep it simple let's just do manual mapping
        /// </summary>
        private CategorySummary MapCategory(CustomEntityRenderSummary renderSummary)
        {
            // A CustomEntityRenderSummary will always contain the data model for the custom entity 
            var model = renderSummary.Model as CategoryDataModel;

            var category = new CategorySummary();
            category.CategoryId = renderSummary.CustomEntityId;
            category.Title = renderSummary.Title;
            category.ShortDescription = model?.ShortDescription;

            return category;
        }
    }
}