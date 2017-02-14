using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using Cofoundry.Core;

namespace Cofoundry.Samples.SimpleSite
{
    /// <summary>
    /// Here we use child actions to dynamically render out lists
    /// of blog posts and categories. For this simple example all 
    /// our data access is done in the controller, but this could
    /// easily be structured in a separate layer. We have examples
    /// of this in our more advanced samples.
    /// </summary>
    [RoutePrefix("BlogPosts")]
    public class BlogPostsController : Controller
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IImageAssetRepository _imageAssetRepository;

        public BlogPostsController(
            ICustomEntityRepository customEntityRepository,
            IImageAssetRepository imageAssetRepository
            )
        {
            _customEntityRepository = customEntityRepository;
            _imageAssetRepository = imageAssetRepository;
        }

        [ChildActionOnly]
        public ActionResult HomepageBlogPosts()
        {
            var query = new SearchCustomEntityRenderSummariesQuery();
            query.CustomEntityDefinitionCode = BlogPostCustomEntityDefinition.DefinitionCode;
            query.PageSize = 3;

            var entities = _customEntityRepository.SearchCustomEntityRenderSummaries(query);
            var viewModel = MapBlogPosts(entities);

            return View(viewModel);
        }

        [ChildActionOnly]
        public ActionResult BlogPostList([QueryString] SearchBlogPostsQuery webQuery)
        {
            var query = new SearchCustomEntityRenderSummariesQuery();
            query.CustomEntityDefinitionCode = BlogPostCustomEntityDefinition.DefinitionCode;
            query.PageNumber = webQuery.PageNumber;
            query.PageSize = 30;

            // TODO: Filtering by Category (webQuery.CategoryId)
            // Searching/filtering custom entities is not implemented yet, but it
            // is possible to build your own search index using the message handling
            // framework or writing a custom query against the UnstructuredDataDependency table

            var entities = _customEntityRepository.SearchCustomEntityRenderSummaries(query);
            var viewModel = MapBlogPosts(entities);

            return View(viewModel);
        }

        [ChildActionOnly]
        public ActionResult SidebarCategories()
        {
            var query = new SearchCustomEntityRenderSummariesQuery();
            query.CustomEntityDefinitionCode = CategoryCustomEntityDefinition.DefinitionCode;
            query.PageSize = 20;
            query.SortBy = CustomEntityQuerySortType.Title;

            var entities = _customEntityRepository.SearchCustomEntityRenderSummaries(query);
            var viewModel = MapCategories(entities);

            return View(viewModel);
        }

        private PagedQueryResult<BlogPostSummary> MapBlogPosts(PagedQueryResult<CustomEntityRenderSummary> customEntityResult)
        {
            var blogPosts = new List<BlogPostSummary>(customEntityResult.Items.Count());

            var imageAssetIds = customEntityResult
                .Items
                .Select(i => (BlogPostDataModel)i.Model)
                .Select(m => m.ThumbnailImageAssetId)
                .Distinct();

            var images = _imageAssetRepository.GetImageAssetRenderDetailsByIdRange(imageAssetIds);

            foreach (var customEntity in customEntityResult.Items)
            {
                var model = (BlogPostDataModel)customEntity.Model;

                var blogPost = new BlogPostSummary();
                blogPost.Title = customEntity.Title;
                blogPost.ShortDescription = model.ShortDescription;
                blogPost.ThumbnailImageAsset = images.GetOrDefault(model.ThumbnailImageAssetId);
                blogPost.FullPath = customEntity.DetailsPageUrls.FirstOrDefault();
                blogPost.PostDate = customEntity.CreateDate;

                blogPosts.Add(blogPost);
            }

            return customEntityResult.ChangeType(blogPosts);
        }

        private IEnumerable<CategorySummary> MapCategories(PagedQueryResult<CustomEntityRenderSummary> customEntityResult)
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