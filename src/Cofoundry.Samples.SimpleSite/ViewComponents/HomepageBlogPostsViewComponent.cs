using Cofoundry.Core;
using Cofoundry.Domain;
using Cofoundry.Web;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SimpleSite
{
    public class HomepageBlogPostsViewComponent : ViewComponent
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IImageAssetRepository _imageAssetRepository;
        private readonly IVisualEditorStateService _visualEditorStateService;

        public HomepageBlogPostsViewComponent(
            ICustomEntityRepository customEntityRepository,
            IImageAssetRepository imageAssetRepository,
            IVisualEditorStateService visualEditorStateService
            )
        {
            _customEntityRepository = customEntityRepository;
            _imageAssetRepository = imageAssetRepository;
            _visualEditorStateService = visualEditorStateService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            // We can use the current visual editor state (e.g. edit mode, live mode) to
            // determine whether to show unpublished blog posts in the list.
            var visualEditorState = await _visualEditorStateService.GetCurrentAsync();
            var ambientEntityPublishStatusQuery = visualEditorState.GetAmbientEntityPublishStatusQuery();

            var query = new SearchCustomEntityRenderSummariesQuery()
            {
                CustomEntityDefinitionCode = BlogPostCustomEntityDefinition.DefinitionCode,
                PageSize = 3,
                PublishStatus = ambientEntityPublishStatusQuery
            };

            var entities = await _customEntityRepository.SearchCustomEntityRenderSummariesAsync(query);
            var viewModel = await MapBlogPostsAsync(entities, ambientEntityPublishStatusQuery);

            return View(viewModel);
        }

        /// <summary>
        /// Here we map the raw custom entity data from Cofoundry into our
        /// own BlogPostSummary which will get sent to be rendered in the 
        /// view.
        /// 
        /// This code is repeated in BlogPostListViewComponent for 
        /// simplicity, but typically you'd put the code into a shared 
        /// mapper or break data access out into it's own shared layer.
        /// </summary>
        private async Task<PagedQueryResult<BlogPostSummary>> MapBlogPostsAsync(
            PagedQueryResult<CustomEntityRenderSummary> customEntityResult,
            PublishStatusQuery ambientEntityPublishStatusQuery
            )
        {
            var blogPosts = new List<BlogPostSummary>(customEntityResult.Items.Count());

            var imageAssetIds = customEntityResult
                .Items
                .Select(i => (BlogPostDataModel)i.Model)
                .Select(m => m.ThumbnailImageAssetId)
                .Distinct();

            var authorIds = customEntityResult
                .Items
                .Select(i => (BlogPostDataModel)i.Model)
                .Select(m => m.AuthorId)
                .Distinct();

            var imageLookup = await _imageAssetRepository.GetImageAssetRenderDetailsByIdRangeAsync(imageAssetIds);
            var authorQuery = new GetCustomEntityRenderSummariesByIdRangeQuery(authorIds, ambientEntityPublishStatusQuery);
            var authorLookup = await _customEntityRepository.GetCustomEntityRenderSummariesByIdRangeAsync(authorQuery);

            foreach (var customEntity in customEntityResult.Items)
            {
                var model = (BlogPostDataModel)customEntity.Model;

                var blogPost = new BlogPostSummary();
                blogPost.Title = customEntity.Title;
                blogPost.ShortDescription = model.ShortDescription;
                blogPost.ThumbnailImageAsset = imageLookup.GetOrDefault(model.ThumbnailImageAssetId);
                blogPost.FullPath = customEntity.PageUrls.FirstOrDefault();
                blogPost.PostDate = customEntity.PublishDate;

                var author = authorLookup.GetOrDefault(model.AuthorId);
                if (author != null)
                {
                    blogPost.AuthorName = author.Title;
                }

                blogPosts.Add(blogPost);
            }

            return customEntityResult.ChangeType(blogPosts);
        }
    }
}
