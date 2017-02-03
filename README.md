# Cofoundry.Samples.SimpleSite

A simple website implementing content management and some framework features including:

- Startup registration
- Page Templates
- Custom Page Modules
- Image content
- Two custom entities - blog post and category
- Querying and display a list of blog posts
- A blog post custom entity details page
- A simple contact form
- Email notifications & Email Templating
- Bundling Registration
- Custom error pages
- Configuration Settings

To get started:

#### To get started:

1. Create a database named 'Cofoundry.Samples.SimpleSite' and check the Cofoundry connection string in the web.config file is correct for you sql server instance
2. Run the website and navigate to *"/admin"*, which will display the setup screen
3. Enter an application name and setup your user account. Submit the form to complete the site setup. 
4. Either log in and enter your own data or follow the steps below to import some test data

#### Importing test data:

To get you started we've put together some optional test data:

1. Run `InitData\Init.sql` script against your db to populate some initial pages and blog posts
2. Copy the images from *"\InitData\Images"* to *"\src\Cofoundry.Samples.SimpleSite\App_Data\Files\Images"*
3. Restart the site. This is required to break the cache, but there will be an option in the UI to do this soon (see [issue #40](https://github.com/cofoundry-cms/cofoundry/issues/40))