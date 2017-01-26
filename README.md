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

1. Create a database named 'Cofoundry.Samples.SimpleSite' and check the Cofoundry connection string in the web.config file is correct for you sql server instance
2. Run the website which should display the Setup screen, but don't enter any information yet.
3. Run `InitData/Init.sql` script against your db
4. On the setup screen enter a website name and your default credentials. Submit the form to complete the site setup