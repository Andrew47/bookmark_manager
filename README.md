# Week 4 of Makers Academy: Bookmark Manager Website

##Installation Instructions

Run the following in the command line:

```
git clone git@github.com:Andrew47/bookmark_manager.git
bundle
createdb bookmark_manager_development
rake db:auto_migrate!
cd bookmark_manager
bundle
rackup
```

Then click the following link, or copy and paste the URL: [http://localhost:9292](http://localhost:9292).

##Accessing the application website

Click the following link, or copy and paste the URL: [http://apburnie-bookmanager.herokuapp.com/users/new](http://apburnie-bookmanager.herokuapp.com/users/new).

##Using the application

###Home-Page

If you are a new user, fill in all of the fields, and then click 'Sign Up'.
Alternatively, returning users need only fill in Name, Email and Password, and then should
click 'Sign In'.

###Links Page
To leave the links page, click 'Sign out'.

To filter by tag, fill in the 'Tag' field and then click 'Filter by tag'.

To add a new link, click 'Add Link'. You will be redirected to a new page. Here you must fill in
the fields and click 'Add Link' to add a new link.
