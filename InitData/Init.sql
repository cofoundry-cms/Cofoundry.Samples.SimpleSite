
/* ENTITY DEFINITIONS */

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCEV'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEV', N'Custom Entity Version')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCEM'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEM', N'Custom Entity Version Page Module')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFDOC'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFDOC', N'Document')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFIMG'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFIMG', N'Image')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPGE'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPGE', N'Page')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPTL'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPTL', N'Page Template')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPGM'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPGM', N'Page Version Module')

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFRWR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFRWR', N'Rewrite Rule')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFROL'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEV', N'Role')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFSET'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFSET', N'Settings')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFUSR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFUSR', N'User (Cofoundry)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCUR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCUR', N'User (Current)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFUSN'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFUSN', N'User (Non Cofoundry)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFDIR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFDIR', N'Web Directory')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'SIMBLP'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'SIMBLP', N'Blog Post')
if (not exists (select * from Cofoundry.[CustomEntityDefinition] where [CustomEntityDefinitionCode] = 'SIMBLP'))
	INSERT [Cofoundry].[CustomEntityDefinition] ([CustomEntityDefinitionCode], [ForceUrlSlugUniqueness], [IsOrderable], [HasLocale]) VALUES (N'SIMBLP', 0, 0, 0)
go
/* PAGE TEMPLATE */

SET IDENTITY_INSERT [Cofoundry].[PageTemplate] ON 
go

INSERT [Cofoundry].[PageTemplate] ([PageTemplateId], [FileName], [Description], [CreateDate], [CreatorId], [FullPath], [Name], [CustomEntityDefinitionCode], [CustomEntityModelType], [PageTypeId]) VALUES (1, N'BlogPostList', N'', CAST(N'2016-10-11 16:31:02.0332000' AS DateTime2), 1, N'/Cofoundry/PageTemplates/_BlogPostList.cshtml', N'Blog post list', NULL, NULL, 1)
INSERT [Cofoundry].[PageTemplate] ([PageTemplateId], [FileName], [Description], [CreateDate], [CreatorId], [FullPath], [Name], [CustomEntityDefinitionCode], [CustomEntityModelType], [PageTypeId]) VALUES (2, N'BlogPostDetails', N'', CAST(N'2016-10-11 16:31:42.1733000' AS DateTime2), 1, N'/Cofoundry/PageTemplates/_BlogPostDetails.cshtml', N'Blog post details', N'SIMBLP', N'BlogPostDetailsDisplayModel', 2)
INSERT [Cofoundry].[PageTemplate] ([PageTemplateId], [FileName], [Description], [CreateDate], [CreatorId], [FullPath], [Name], [CustomEntityDefinitionCode], [CustomEntityModelType], [PageTypeId]) VALUES (3, N'Home', N'', CAST(N'2016-10-11 16:31:54.6073000' AS DateTime2), 1, N'/Cofoundry/PageTemplates/_Home.cshtml', N'Home', NULL, NULL, 1)
INSERT [Cofoundry].[PageTemplate] ([PageTemplateId], [FileName], [Description], [CreateDate], [CreatorId], [FullPath], [Name], [CustomEntityDefinitionCode], [CustomEntityModelType], [PageTypeId]) VALUES (4, N'General', N'', CAST(N'2016-10-18 16:55:35.7846000' AS DateTime2), 1, N'/Cofoundry/PageTemplates/_General.cshtml', N'General', NULL, NULL, 1)
INSERT [Cofoundry].[PageTemplate] ([PageTemplateId], [FileName], [Description], [CreateDate], [CreatorId], [FullPath], [Name], [CustomEntityDefinitionCode], [CustomEntityModelType], [PageTypeId]) VALUES (5, N'Contact', N'', CAST(N'2016-10-18 16:55:42.2035000' AS DateTime2), 1, N'/Cofoundry/PageTemplates/_Contact.cshtml', N'Contact', NULL, NULL, 1)
go

SET IDENTITY_INSERT [Cofoundry].[PageTemplate] OFF
go


/* PAGE TEMPLATE SECTION */

SET IDENTITY_INSERT [Cofoundry].[PageTemplateSection] ON 

GO
INSERT [Cofoundry].[PageTemplateSection] ([PageTemplateSectionId], [PageTemplateId], [Name], [CreateDate], [CreatorId], [IsCustomEntitySection]) VALUES (1, 2, N'Body', CAST(N'2016-10-11 16:31:42.1733000' AS DateTime2), 1, 0)
INSERT [Cofoundry].[PageTemplateSection] ([PageTemplateSectionId], [PageTemplateId], [Name], [CreateDate], [CreatorId], [IsCustomEntitySection]) VALUES (2, 2, N'Image', CAST(N'2016-10-11 16:31:42.1733000' AS DateTime2), 1, 0)
INSERT [Cofoundry].[PageTemplateSection] ([PageTemplateSectionId], [PageTemplateId], [Name], [CreateDate], [CreatorId], [IsCustomEntitySection]) VALUES (4, 3, N'IntroductionTitle', CAST(N'2016-10-18 16:55:04.4512000' AS DateTime2), 1, 0)
INSERT [Cofoundry].[PageTemplateSection] ([PageTemplateSectionId], [PageTemplateId], [Name], [CreateDate], [CreatorId], [IsCustomEntitySection]) VALUES (5, 3, N'Introduction', CAST(N'2016-10-18 16:55:04.7573000' AS DateTime2), 1, 0)
INSERT [Cofoundry].[PageTemplateSection] ([PageTemplateSectionId], [PageTemplateId], [Name], [CreateDate], [CreatorId], [IsCustomEntitySection]) VALUES (6, 4, N'Body', CAST(N'2016-10-18 16:55:35.7846000' AS DateTime2), 1, 0)
INSERT [Cofoundry].[PageTemplateSection] ([PageTemplateSectionId], [PageTemplateId], [Name], [CreateDate], [CreatorId], [IsCustomEntitySection]) VALUES (7, 5, N'Introduction', CAST(N'2016-10-18 16:55:42.2035000' AS DateTime2), 1, 0)
GO
SET IDENTITY_INSERT [Cofoundry].[PageTemplateSection] OFF
GO

/* PAGE TMODULE TYPE */

SET IDENTITY_INSERT [Cofoundry].[PageModuleType] ON 

GO
INSERT [Cofoundry].[PageModuleType] ([PageModuleTypeId], [Name], [Description], [FileName], [IsCustom], [CreateDate]) VALUES (13, N'Content Section', N'A row of generic page content', N'ContentSection', 1, CAST(N'2016-10-24 11:36:35.8500000' AS DateTime2))
INSERT [Cofoundry].[PageModuleType] ([PageModuleTypeId], [Name], [Description], [FileName], [IsCustom], [CreateDate]) VALUES (14, N'Content Split Section', N'A row of generic page content split into two columns', N'ContentSplitSection', 1, CAST(N'2016-10-24 11:36:35.8500000' AS DateTime2))
GO
SET IDENTITY_INSERT [Cofoundry].[PageModuleType] OFF
GO

/* PAGE TEMPLATE SECTION PAGE MODULE TYPE */

INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (1, 13)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (1, 14)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 1)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 2)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 3)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 4)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 5)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 6)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 7)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 8)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 9)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 10)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 11)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (2, 12)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (4, 1)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (5, 12)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (6, 13)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (6, 14)
INSERT [Cofoundry].[PageTemplateSectionPageModuleType] ([PageTemplateSectionId], [PageModuleTypeId]) VALUES (7, 1)
GO

/* IMAGES */

SET IDENTITY_INSERT [Cofoundry].[ImageAsset] ON 

GO
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [FileDescription], [Width], [Height], [Extension], [FileSize], [CreateDate], [CreatorId], [UpdateDate], [IsDeleted], [ImageCropAnchorLocationId], [UpdaterId]) VALUES (1, N'blog-image', N'Blog-image', 1000, 661, N'jpg', 137409, CAST(N'2016-10-18 09:18:28.7553000' AS DateTime2), 1, CAST(N'2016-10-18 09:18:28.7553000' AS DateTime2), 0, NULL, 1)
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [FileDescription], [Width], [Height], [Extension], [FileSize], [CreateDate], [CreatorId], [UpdateDate], [IsDeleted], [ImageCropAnchorLocationId], [UpdaterId]) VALUES (2, N'smoky-mountains-sunrise', N'Smoky Mountains Sunrise', 960, 640, N'jpg', 54619, CAST(N'2016-10-18 09:23:22.6736000' AS DateTime2), 1, CAST(N'2016-10-18 09:23:22.6736000' AS DateTime2), 0, NULL, 1)
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [FileDescription], [Width], [Height], [Extension], [FileSize], [CreateDate], [CreatorId], [UpdateDate], [IsDeleted], [ImageCropAnchorLocationId], [UpdaterId]) VALUES (3, N'snow-landscape', N'Snow-landscape', 960, 539, N'jpg', 216579, CAST(N'2016-10-18 09:23:42.8238000' AS DateTime2), 1, CAST(N'2016-10-18 09:23:42.8238000' AS DateTime2), 0, NULL, 1)
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [FileDescription], [Width], [Height], [Extension], [FileSize], [CreateDate], [CreatorId], [UpdateDate], [IsDeleted], [ImageCropAnchorLocationId], [UpdaterId]) VALUES (4, N'sunset-mountain', N'Sunset Mountain', 4247, 2786, N'jpg', 3142819, CAST(N'2016-10-18 09:26:45.5788000' AS DateTime2), 1, CAST(N'2016-10-18 09:26:45.5788000' AS DateTime2), 0, NULL, 1)
GO
SET IDENTITY_INSERT [Cofoundry].[ImageAsset] OFF
GO


SET IDENTITY_INSERT [Cofoundry].[WebDirectory] ON 

GO

/* WEB DIRECTORY */

declare @RootWebDirectoryId int
select @RootWebDirectoryId = WebDirectoryId from Cofoundry.WebDirectory where UrlPath = ''

INSERT [Cofoundry].[WebDirectory] ([WebDirectoryId], [ParentWebDirectoryId], [Name], [UrlPath], [IsActive], [CreateDate], [CreatorId]) VALUES (2, @RootWebDirectoryId, N'Blog', N'blog', 1, CAST(N'2016-10-11 16:37:14.4427000' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [Cofoundry].[WebDirectory] OFF
GO

/* PAGE */

SET IDENTITY_INSERT [Cofoundry].[Page] ON 

GO
INSERT [Cofoundry].[Page] ([PageId], [WebDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode]) VALUES (1, 2, NULL, N'', 1, 0, CAST(N'2016-10-11 16:35:25.5615000' AS DateTime2), 1, NULL)
INSERT [Cofoundry].[Page] ([PageId], [WebDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode]) VALUES (2, 1, NULL, N'', 1, 0, CAST(N'2016-10-11 16:39:21.2138000' AS DateTime2), 1, NULL)
INSERT [Cofoundry].[Page] ([PageId], [WebDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode]) VALUES (3, 2, NULL, N'{Id}/{UrlSlug}', 2, 0, CAST(N'2016-10-11 16:41:35.5760000' AS DateTime2), 1, N'SIMBLP')
INSERT [Cofoundry].[Page] ([PageId], [WebDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode]) VALUES (4, 1, NULL, N'contact', 1, 0, CAST(N'2016-10-18 16:56:38.1173000' AS DateTime2), 1, NULL)
INSERT [Cofoundry].[Page] ([PageId], [WebDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode]) VALUES (5, 1, NULL, N'about', 1, 0, CAST(N'2016-10-18 16:57:38.8329000' AS DateTime2), 1, NULL)
GO
SET IDENTITY_INSERT [Cofoundry].[Page] OFF
GO

/* PAGE VERSION */

SET IDENTITY_INSERT [Cofoundry].[PageVersion] ON 

GO
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (1, 1, 1, NULL, N'Blog', N'Somethign about Blog', N'', 4, 0, CAST(N'2016-10-11 16:35:25.5615000' AS DateTime2), 1, 0, NULL, NULL, NULL)
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (2, 2, 3, NULL, N'Home', N'Simple site homepage', N'', 5, 0, CAST(N'2016-10-11 16:39:21.2138000' AS DateTime2), 1, 0, NULL, NULL, NULL)
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (3, 3, 2, NULL, N'Blog Post', N'Blog post', N'', 4, 0, CAST(N'2016-10-11 16:41:35.5760000' AS DateTime2), 1, 0, NULL, NULL, NULL)
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (4, 4, 5, NULL, N'Contact Us', N'Get in touch!', N'', 5, 0, CAST(N'2016-10-18 16:56:38.1173000' AS DateTime2), 1, 0, NULL, NULL, NULL)
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (5, 5, 4, NULL, N'About Example Inc.', N'Find out what we''re all about', N'', 5, 0, CAST(N'2016-10-18 16:57:38.8329000' AS DateTime2), 1, 0, NULL, NULL, NULL)
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (6, 2, 3, 2, N'Home', N'Simple site homepage', N'', 4, 0, CAST(N'2016-10-24 09:34:40.3230000' AS DateTime2), 1, 0, NULL, NULL, NULL)
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (7, 5, 4, 5, N'About Example Inc.', N'Find out what we''re all about', N'', 4, 0, CAST(N'2016-10-24 14:58:28.4270000' AS DateTime2), 1, 0, NULL, NULL, NULL)
INSERT [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [MetaKeywords], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (8, 4, 5, 4, N'Contact Us', N'Get in touch!', N'', 4, 0, CAST(N'2016-10-24 15:43:29.0930000' AS DateTime2), 1, 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [Cofoundry].[PageVersion] OFF
GO

/* PAGE MODULE TYPE TEMPLATE */

SET IDENTITY_INSERT [Cofoundry].[PageModuleTypeTemplate] ON 

GO
INSERT [Cofoundry].[PageModuleTypeTemplate] ([PageModuleTypeTemplateId], [PageModuleTypeId], [Name], [FileName], [CreateDate], [CreatorId]) VALUES (1, 14, N'Reversed', N'ContentSplitSectionReverse', CAST(N'2016-10-24 13:27:24.4470000' AS DateTime2), 1)
SET IDENTITY_INSERT [Cofoundry].[PageModuleTypeTemplate] OFF
GO

/* PAGE VERSION MODULE */

SET IDENTITY_INSERT [Cofoundry].[PageVersionModule] ON 

GO
INSERT [Cofoundry].[PageVersionModule] ([PageVersionModuleId], [PageVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [CreateDate], [CreatorId], [UpdateDate], [PageModuleTypeTemplateId]) VALUES (1, 6, 4, 1, N'{"plainText":"Hello, world!"}', 1, CAST(N'2016-10-24 09:41:59.7280000' AS DateTime2), 1, CAST(N'2016-10-24 09:41:59.7280000' AS DateTime2), NULL)
INSERT [Cofoundry].[PageVersionModule] ([PageVersionModuleId], [PageVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [CreateDate], [CreatorId], [UpdateDate], [PageModuleTypeTemplateId]) VALUES (2, 6, 5, 12, N'{"rawHtml":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque. Phasellus sodales mauris nunc, quis tempor dui blandit vitae. Nullam ornare efficitur felis, eu tristique risus lacinia quis. Quisque tempor, magna id fringilla consectetur, nulla augue venenatis turpis, consequat congue justo eros semper turpis. Integer eget ipsum sollicitudin, vulputate risus a, laoreet lectus. Quisque ornare feugiat neque, id pellentesque sapien imperdiet vel.<br></p>"}', 1, CAST(N'2016-10-24 09:43:54.3592000' AS DateTime2), 1, CAST(N'2016-10-24 09:43:54.3592000' AS DateTime2), NULL)
INSERT [Cofoundry].[PageVersionModule] ([PageVersionModuleId], [PageVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [CreateDate], [CreatorId], [UpdateDate], [PageModuleTypeTemplateId]) VALUES (3, 7, 6, 13, N'{"title":null,"htmlText":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque. Phasellus sodales mauris nunc, quis tempor dui blandit vitae. Nullam ornare efficitur felis, eu tristique risus lacinia quis. Quisque tempor, magna id fringilla consectetur, nulla augue venenatis turpis, consequat congue justo eros semper turpis. Integer eget ipsum sollicitudin, vulputate risus a, laoreet lectus. Quisque ornare feugiat neque, id pellentesque sapien imperdiet vel.<br></p>"}', 1, CAST(N'2016-10-24 15:10:24.9635000' AS DateTime2), 1, CAST(N'2016-10-24 15:10:24.9635000' AS DateTime2), NULL)
INSERT [Cofoundry].[PageVersionModule] ([PageVersionModuleId], [PageVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [CreateDate], [CreatorId], [UpdateDate], [PageModuleTypeTemplateId]) VALUES (4, 7, 6, 14, N'{"title":"Lorem ipsum dolor sit amet","htmlText":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque.<br></p><p>Vivamus id turpis et purus semper viverra id ut purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate tincidunt ex, ac lobortis erat molestie a. Nulla facilisi. Donec egestas quis sem in bibendum. Curabitur pellentesque accumsan lorem, id ultrices orci scelerisque vitae. Praesent condimentum lorem sed sapien lobortis facilisis. Sed posuere purus quis augue varius commodo. Donec leo tellus, suscipit eu est efficitur, auctor dignissim dolor. Curabitur facilisis sollicitudin ultricies. Sed eget aliquet lorem. Aliquam erat volutpat. Morbi auctor, nulla eu efficitur pharetra, lorem leo lobortis turpis, in elementum enim nibh vel velit.<br></p>","imageAssetId":1}', 2, CAST(N'2016-10-24 15:11:07.0983000' AS DateTime2), 1, CAST(N'2016-10-24 15:11:07.0983000' AS DateTime2), NULL)
INSERT [Cofoundry].[PageVersionModule] ([PageVersionModuleId], [PageVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [CreateDate], [CreatorId], [UpdateDate], [PageModuleTypeTemplateId]) VALUES (5, 7, 6, 13, N'{"title":"Curabitur facilisis","htmlText":"<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque.</span><br></p><p>Vivamus id turpis et purus semper viverra id ut purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate tincidunt ex, ac lobortis erat molestie a. Nulla facilisi. Donec egestas quis sem in bibendum. Curabitur pellentesque accumsan lorem, id ultrices orci scelerisque vitae. Praesent condimentum lorem sed sapien lobortis facilisis. Sed posuere purus quis augue varius commodo. Donec leo tellus, suscipit eu est efficitur, auctor dignissim dolor. Curabitur facilisis sollicitudin ultricies. Sed eget aliquet lorem. Aliquam erat volutpat. Morbi auctor, nulla eu efficitur pharetra, lorem leo lobortis turpis, in elementum enim nibh vel velit.</p>"}', 3, CAST(N'2016-10-24 15:11:26.5431000' AS DateTime2), 1, CAST(N'2016-10-24 15:11:46.0171000' AS DateTime2), NULL)
INSERT [Cofoundry].[PageVersionModule] ([PageVersionModuleId], [PageVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [CreateDate], [CreatorId], [UpdateDate], [PageModuleTypeTemplateId]) VALUES (6, 8, 7, 1, N'{"plainText":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus."}', 1, CAST(N'2016-10-24 15:48:37.5052000' AS DateTime2), 1, CAST(N'2016-10-24 15:48:37.5052000' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [Cofoundry].[PageVersionModule] OFF
GO

/* CUSTOM ENTITY */

SET IDENTITY_INSERT [Cofoundry].[CustomEntity] ON 

GO
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], [Ordering]) VALUES (1, N'SIMBLP', NULL, N'first-blog-post', CAST(N'2016-08-06 15:24:26.4831000' AS DateTime2), 1, NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], [Ordering]) VALUES (2, N'SIMBLP', NULL, N'second-blog-post', CAST(N'2016-09-12 09:50:03.3945000' AS DateTime2), 1, NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], [Ordering]) VALUES (3, N'SIMBLP', NULL, N'third-blog-post', CAST(N'2016-10-18 10:27:04.2217000' AS DateTime2), 1, NULL)
GO
SET IDENTITY_INSERT [Cofoundry].[CustomEntity] OFF
GO

/* CUSTOM ENTITY VERSION */

SET IDENTITY_INSERT [Cofoundry].[CustomEntityVersion] ON 

GO
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (1, 1, N'First Blog Post', 5, N'{"shortDescription":"Aenean aliquet, leo sit amet facilisis accumsan, elit tortor dapibus ex, sit amet pellentesque nunc nulla at nulla. Phasellus ac velit non sem placerat mattis vel sit amet magna. Nullam at ipsum aliquam, lacinia elit venenatis, mollis dui.","thumbnailImageAssetId":3}', CAST(N'2016-08-06 15:24:26.4831000' AS DateTime2), 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (2, 2, N'Second Blog Post', 5, N'{"shortDescription":"Aenean aliquet, leo sit amet facilisis accumsan, elit tortor dapibus ex, sit amet pellentesque nunc nulla at nulla. Phasellus ac velit non sem placerat mattis vel sit amet magna. Nullam at ipsum aliquam, lacinia elit venenatis, mollis dui.","thumbnailImageAssetId":1}', CAST(N'2016-09-12 09:50:03.3945000' AS DateTime2), 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (3, 3, N'Third Blog Post', 5, N'{"shortDescription":"Aenean aliquet, leo sit amet facilisis accumsan, elit tortor dapibus ex, sit amet pellentesque nunc nulla at nulla. Phasellus ac velit non sem placerat mattis vel sit amet magna. Nullam at ipsum aliquam, lacinia elit venenatis, mollis dui.","thumbnailImageAssetId":4}', CAST(N'2016-10-18 10:27:04.2217000' AS DateTime2), 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (4, 3, N'Third Blog Post', 4, N'{"shortDescription":"Aenean aliquet, leo sit amet facilisis accumsan, elit tortor dapibus ex, sit amet pellentesque nunc nulla at nulla. Phasellus ac velit non sem placerat mattis vel sit amet magna. Nullam at ipsum aliquam, lacinia elit venenatis, mollis dui.","thumbnailImageAssetId":4}', CAST(N'2016-10-24 11:18:49.4630000' AS DateTime2), 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (5, 2, N'Second Blog Post', 4, N'{"shortDescription":"Aenean aliquet, leo sit amet facilisis accumsan, elit tortor dapibus ex, sit amet pellentesque nunc nulla at nulla. Phasellus ac velit non sem placerat mattis vel sit amet magna. Nullam at ipsum aliquam, lacinia elit venenatis, mollis dui.","thumbnailImageAssetId":1}', CAST(N'2016-09-12 13:55:04.7930000' AS DateTime2), 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (6, 1, N'First Blog Post', 4, N'{"shortDescription":"Aenean aliquet, leo sit amet facilisis accumsan, elit tortor dapibus ex, sit amet pellentesque nunc nulla at nulla. Phasellus ac velit non sem placerat mattis vel sit amet magna. Nullam at ipsum aliquam, lacinia elit venenatis, mollis dui.","thumbnailImageAssetId":3}', CAST(N'2016-08-06 16:06:59.5270000' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [Cofoundry].[CustomEntityVersion] OFF

/* CUSTOM ENTITY VERSION PAGE MODULE */

SET IDENTITY_INSERT [Cofoundry].[CustomEntityVersionPageModule] ON 

GO
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (1, 4, 1, 13, N'{"title":"What a blog post this is!","htmlText":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque. Phasellus sodales mauris nunc, quis tempor dui blandit vitae. Nullam ornare efficitur felis, eu tristique risus lacinia quis. Quisque tempor, magna id fringilla consectetur, nulla augue venenatis turpis, consequat congue justo eros semper turpis. Integer eget ipsum sollicitudin, vulputate risus a, laoreet lectus. Quisque ornare feugiat neque, id pellentesque sapien imperdiet vel.<br></p>"}', 1, NULL)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (2, 4, 1, 14, N'{"title":"Lorem ipsum dolor sit amet","htmlText":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque.<br></p><p>Vivamus id turpis et purus semper viverra id ut purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate tincidunt ex, ac lobortis erat molestie a. Nulla facilisi. Donec egestas quis sem in bibendum. Curabitur pellentesque accumsan lorem, id ultrices orci scelerisque vitae. Praesent condimentum lorem sed sapien lobortis facilisis. Sed posuere purus quis augue varius commodo. Donec leo tellus, suscipit eu est efficitur, auctor dignissim dolor. Curabitur facilisis sollicitudin ultricies. Sed eget aliquet lorem. Aliquam erat volutpat. Morbi auctor, nulla eu efficitur pharetra, lorem leo lobortis turpis, in elementum enim nibh vel velit.<br></p>","imageAssetId":4}', 2, NULL)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (3, 4, 1, 14, N'{"title":"Lorem ipsum dolor sit amet","htmlText":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque.<br></p><p>Vivamus id turpis et purus semper viverra id ut purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate tincidunt ex, ac lobortis erat molestie a. Nulla facilisi. Donec egestas quis sem in bibendum. Curabitur pellentesque accumsan lorem, id ultrices orci scelerisque vitae. Praesent condimentum lorem sed sapien lobortis facilisis. Sed posuere purus quis augue varius commodo. Donec leo tellus, suscipit eu est efficitur, auctor dignissim dolor. Curabitur facilisis sollicitudin ultricies. Sed eget aliquet lorem. Aliquam erat volutpat. Morbi auctor, nulla eu efficitur pharetra, lorem leo lobortis turpis, in elementum enim nibh vel velit.<br></p>","imageAssetId":3}', 3, 1)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (4, 5, 1, 13, N'{"title":null,"htmlText":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque. Phasellus sodales mauris nunc, quis tempor dui blandit vitae. Nullam ornare efficitur felis, eu tristique risus lacinia quis. Quisque tempor, magna id fringilla consectetur, nulla augue venenatis turpis, consequat congue justo eros semper turpis. Integer eget ipsum sollicitudin, vulputate risus a, laoreet lectus. Quisque ornare feugiat neque, id pellentesque sapien imperdiet vel.<br></p>"}', 1, NULL)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (5, 5, 1, 14, N'{"title":null,"htmlText":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque.<br></p><p>Vivamus id turpis et purus semper viverra id ut purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate tincidunt ex, ac lobortis erat molestie a. Nulla facilisi. Donec egestas quis sem in bibendum. Curabitur pellentesque accumsan lorem, id ultrices orci scelerisque vitae. Praesent condimentum lorem sed sapien lobortis facilisis. Sed posuere purus quis augue varius commodo. Donec leo tellus, suscipit eu est efficitur, auctor dignissim dolor. Curabitur facilisis sollicitudin ultricies. Sed eget aliquet lorem. Aliquam erat volutpat. Morbi auctor, nulla eu efficitur pharetra, lorem leo lobortis turpis, in elementum enim nibh vel velit.<br></p>","imageAssetId":3}', 2, 1)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (6, 5, 1, 14, N'{"title":"Aliquam erat volutpat","htmlText":"<p>Vivamus id turpis et purus semper viverra id ut purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate tincidunt ex, ac lobortis erat molestie a. Nulla facilisi. Donec egestas quis sem in bibendum. Curabitur pellentesque accumsan lorem, id ultrices orci scelerisque vitae. Praesent condimentum lorem sed sapien lobortis facilisis. Sed posuere purus quis augue varius commodo. Donec leo tellus, suscipit eu est efficitur, auctor dignissim dolor. Curabitur facilisis sollicitudin ultricies. Sed eget aliquet lorem. Aliquam erat volutpat. Morbi auctor, nulla eu efficitur pharetra, lorem leo lobortis turpis, in elementum enim nibh vel velit.<br></p>","imageAssetId":1}', 3, NULL)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (7, 6, 1, 13, N'{"title":"Integer eget ipsum sollicitudin","htmlText":"<p><br><!--StartFragment--><span style=\"float: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque. Phasellus sodales mauris nunc, quis tempor dui blandit vitae. Nullam ornare efficitur felis, eu tristique risus lacinia quis. Quisque tempor, magna id fringilla consectetur, nulla augue venenatis turpis, consequat congue justo eros semper turpis. Integer eget ipsum sollicitudin, vulputate risus a, laoreet lectus. Quisque ornare feugiat neque, id pellentesque sapien imperdiet vel.</span><!--EndFragment--><br><br><br></p>"}', 1, NULL)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (8, 6, 1, 14, N'{"title":"Id pellentesque sapien imperdiet vel","htmlText":"<p><span>Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque. Phasellus sodales mauris nunc, quis tempor dui blandit vitae. Nullam ornare efficitur felis, eu tristique risus lacinia quis. Quisque tempor, magna id fringilla consectetur, nulla augue venenatis turpis, consequat congue justo eros semper turpis. Integer eget ipsum sollicitudin, vulputate risus a, laoreet lectus. Quisque ornare feugiat neque, id pellentesque sapien imperdiet vel.</span></p>","imageAssetId":4}', 2, NULL)
INSERT [Cofoundry].[CustomEntityVersionPageModule] ([CustomEntityVersionPageModuleId], [CustomEntityVersionId], [PageTemplateSectionId], [PageModuleTypeId], [SerializedData], [Ordering], [PageModuleTypeTemplateId]) VALUES (9, 6, 1, 14, N'{"title":"Fringilla consectetur","htmlText":"<p><span style=\"float: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu enim id odio pretium faucibus vel id risus. Duis auctor lobortis tortor quis vehicula. Maecenas consequat felis augue, vel bibendum velit vulputate ac. Donec laoreet nunc sed turpis iaculis rhoncus. Fusce sit amet tempor nisl, eu rhoncus dolor. Morbi vestibulum at arcu a accumsan. Praesent eget dui dictum, facilisis ante eu, sagittis purus. Donec sit amet euismod felis, ut vestibulum purus. Donec gravida scelerisque ex ac scelerisque. Phasellus sodales mauris nunc, quis tempor dui blandit vitae. Nullam ornare efficitur felis, eu tristique risus lacinia quis.</span><br><br><span style=\"float: none;\">Quisque tempor, magna id fringilla consectetur, nulla augue venenatis turpis, consequat congue justo eros semper turpis. Integer eget ipsum sollicitudin, vulputate risus a, laoreet lectus. Quisque ornare feugiat neque, id pellentesque sapien imperdiet vel.</span><br><!--EndFragment--><br><br><br></p>","imageAssetId":2}', 3, 1)
GO
SET IDENTITY_INSERT [Cofoundry].[CustomEntityVersionPageModule] OFF

/* UNSTRUCTURED DATA DEPENDENCY */

GO
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEM', 2, N'COFIMG', 4, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEM', 3, N'COFIMG', 3, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEM', 5, N'COFIMG', 3, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEM', 6, N'COFIMG', 1, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEM', 8, N'COFIMG', 4, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEM', 9, N'COFIMG', 2, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 1, N'COFIMG', 3, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFIMG', 1, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFIMG', 4, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFIMG', 4, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 5, N'COFIMG', 1, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 6, N'COFIMG', 3, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFPGM', 4, N'COFIMG', 1, 1)
GO

/* TAG */

SET IDENTITY_INSERT [Cofoundry].[Tag] ON 

GO
INSERT [Cofoundry].[Tag] ([TagId], [TagText], [CreateDate]) VALUES (1, N'Blog', CAST(N'2016-10-18 09:18:28.7943000' AS DateTime2))
INSERT [Cofoundry].[Tag] ([TagId], [TagText], [CreateDate]) VALUES (2, N'Blogimage', CAST(N'2016-10-18 09:18:28.7943000' AS DateTime2))
INSERT [Cofoundry].[Tag] ([TagId], [TagText], [CreateDate]) VALUES (3, N'Mountain Sunrise', CAST(N'2016-10-18 09:23:22.6891000' AS DateTime2))
INSERT [Cofoundry].[Tag] ([TagId], [TagText], [CreateDate]) VALUES (4, N'Snow Landscape', CAST(N'2016-10-18 09:23:42.8284000' AS DateTime2))
INSERT [Cofoundry].[Tag] ([TagId], [TagText], [CreateDate]) VALUES (5, N'Mountains', CAST(N'2016-10-18 09:23:42.8284000' AS DateTime2))
INSERT [Cofoundry].[Tag] ([TagId], [TagText], [CreateDate]) VALUES (6, N'Sunset', CAST(N'2016-10-18 09:26:45.5838000' AS DateTime2))
GO
SET IDENTITY_INSERT [Cofoundry].[Tag] OFF

/* IMAGE TAG */

GO
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (1, 1, CAST(N'2016-10-18 09:18:28.7553000' AS DateTime2), 1)
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (1, 2, CAST(N'2016-10-18 09:18:28.7553000' AS DateTime2), 1)
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (2, 1, CAST(N'2016-10-18 09:23:22.6736000' AS DateTime2), 1)
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (2, 3, CAST(N'2016-10-18 09:23:22.6736000' AS DateTime2), 1)
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (3, 4, CAST(N'2016-10-18 09:23:42.8238000' AS DateTime2), 1)
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (3, 5, CAST(N'2016-10-18 09:23:42.8238000' AS DateTime2), 1)
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (4, 1, CAST(N'2016-10-18 09:26:45.5788000' AS DateTime2), 1)
INSERT [Cofoundry].[ImageAssetTag] ([ImageAssetId], [TagId], [CreateDate], [CreatorId]) VALUES (4, 6, CAST(N'2016-10-18 09:26:45.5788000' AS DateTime2), 1)
GO
