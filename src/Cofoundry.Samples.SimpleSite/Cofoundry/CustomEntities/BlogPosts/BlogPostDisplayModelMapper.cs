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
    public class BlogPostDisplayModelMapper 
        : ICustomEntityDisplayModelMapper<BlogPostDataModel, BlogPostDisplayModel>
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IImageAssetRepository _imageAssetRepository;

        public BlogPostDisplayModelMapper(
            ICustomEntityRepository customEntityRepository,
            IImageAssetRepository imageAssetRepository
            )
        {
            _customEntityRepository = customEntityRepository;
            _imageAssetRepository = imageAssetRepository;
        }

        /// <summary>
        /// Maps a raw custom entity data model to a display model that can be rendered out 
        /// to a view template.
        /// </summary>
        /// <param name="renderDetails">
        /// The raw custom entity data pulled from the database.
        /// </param>
        /// <param name="dataModel">
        /// Typed model data to map from. This is the same model that's in the render 
        /// details model, but is passed in as a typed model for easy access.
        /// </param>
        /// <param name="publishStatusQuery">
        /// The query type that should be used to query dependent entities. E.g. if the custom
        /// entity was queried with the Published status query, then any dependent entities should
        /// also be queried as Published.
        /// </param>
        public async Task<BlogPostDisplayModel> MapDisplayModelAsync(
            CustomEntityRenderDetails renderDetails,
            BlogPostDataModel dataModel,
            PublishStatusQuery publishStatusQuery
            )
        {
            var vm = new BlogPostDisplayModel()
            {
                MetaDescription = dataModel.ShortDescription,
                PageTitle = renderDetails.Title,
                Title = renderDetails.Title,
                Date = renderDetails.CreateDate,
                FullPath = renderDetails.PageUrls.FirstOrDefault()
            };

            vm.Categories = await MapCategories(dataModel, publishStatusQuery);
            vm.Author = await MapAuthor(dataModel, publishStatusQuery);

            return vm;
        }

        private async Task<ICollection<CategorySummary>> MapCategories(
            BlogPostDataModel dataModel, 
            PublishStatusQuery publishStatusQuery
            )
        {
            if (EnumerableHelper.IsNullOrEmpty(dataModel.CategoryIds)) return Array.Empty<CategorySummary>();

            // We manually query and map relations which gives us maximum flexibility when
            // mapping models. Fortunately the framework provides tools to make this fairly simple
            var categoriesQuery = new GetCustomEntityRenderSummariesByIdRangeQuery(dataModel.CategoryIds, publishStatusQuery);
            var results = await _customEntityRepository.GetCustomEntityRenderSummariesByIdRangeAsync(categoriesQuery);

            return results
                .FilterAndOrderByKeys(dataModel.CategoryIds)
                .Select(c => MapCategory(c))
                .ToList();
        }

        /// <summary>
        /// We could use AutoMapper here, but to keep it simple let's just do manual mapping
        /// </summary>
        private CategorySummary MapCategory(CustomEntityRenderSummary renderSummary)
        {
            // A CustomEntityRenderSummary will always contain the data model for the custom entity 
            var model = renderSummary.Model as CategoryDataModel;

            var category = new CategorySummary()
            {
                CategoryId = renderSummary.CustomEntityId,
                Title = renderSummary.Title,
                ShortDescription = model?.ShortDescription
            };

            return category;
        }

        private async Task<AuthorDetails> MapAuthor(
            BlogPostDataModel dataModel,
            PublishStatusQuery publishStatusQuery
            )
        {
            if (dataModel.AuthorId < 1) return null;

            var authorQuery = new GetCustomEntityRenderSummaryByIdQuery(dataModel.AuthorId, publishStatusQuery.ToRelatedEntityQueryStatus());
            var dbAuthor = await _customEntityRepository.GetCustomEntityRenderSummaryByIdAsync(authorQuery);

            var model = dbAuthor?.Model as AuthorDataModel;
            if (model == null) return null;

            var author = new AuthorDetails()
            {
                Name = dbAuthor.Title,
                Biography = HtmlFormatter.ConvertToBasicHtml(model.Biography)
            };

            if (model.ProfileImageAssetId < 1) return author;

            author.ProfileImage = await _imageAssetRepository.GetImageAssetRenderDetailsByIdAsync(model.ProfileImageAssetId.Value);

            return author;
        }
    }
}