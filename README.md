# Cofoundry.Samples.SimpleSite

A simple website implementing core features of Cofoundry including:

- Startup registration
- Page Templates
- Custom Page Modules
- Image content
- Two custom entities - blog post and category
- Querying and display a list of blog posts
- A blog post custom entity details page
- A simple contact form
- Email notifications & Email Templating
- Bundling Resgitration
- Registering services with the DI container
- Custom error pages

To get started:

1. Create a database named 'Cofoundry.Samples.SimpleSite' and check the Cofoundry connection string in the web.config file is correct for you sql server instance
2. Run the website which should display the Setup screen
3. Enter a website name and your default credentials and setup the site
5. Run `InitData/Init.sql` script against your db
6. Re-start the site (we need to break the cache on the data we just imported)