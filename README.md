# Planning our application
    1.  Answer Questions
        -  What are we building?
        -  Who are we building it for?
        -  What features do we need to have?
    2.  User Stories
    3.  Model our Data
    4.  Thinking through the page we need in our app
## Questions
    1.  What are we building? We are building a personal site. A place where
       we can blog, share example of our work, and have people contact.
    2.  Who are we building it for? We are building it for ourselves, but also the community.
       Share what we are learning by blogging is a great way to learn for ourselves,
       but we teach other in the process. Show potential employers that we
       know what we are doing.
    3.  What features do we need to have?
            -  Posts
                -  Create/Update/Delete
                -  Markdown
                -  Syntax highlighting
                -  Comments (Disqus)
            -  Projects
                -  Create/Update/Delete
            -  Contact
                -  Contact form
                -  Sendgrid
            -  User (Devise)
## User Stories
    > As a blank, I want to be able to blank, so that blank.
    -  As a User, I want to be able to create posts, so that I can share what I am learning on my blog
    -  As a User, I want to be able to edit & destory that post, so I can manage my blog
    -  As a User, I want to be able to write post in markdown format so that it's easy for me to write posts
    -  As a User, I want to be able to highlight the various syntax of code blocks that I share on my blog.
    -  As a User,  I want to show the visitor and potential employess example of my work , or stuff I've build
    -  As a User, I want to be able to have visitors contact me through a form on my site
    -  As a User, I want wisitor to be able to  leave comment on my blog posts.
## Model our Data
    ### Post ###
        *   title:string
        *   content:text
    ### Project ###
        *   title:string
        *   description:text
        *   link:string
    ### User ###
## Thinking through the page we need in our app
    -  Home
    -  Posts
    -  Posts
    -  Projects
    -  Projects
    -  Contact