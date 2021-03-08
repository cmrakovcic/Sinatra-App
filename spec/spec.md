[x] Use Sinatra to build the app
    - Included in Gemfile and app implements routes.

[x] Use ActiveRecord for storing information in a database
    - Included in Gemfile, uses migrations to create tables and associations are established in the models class.

[x] Include more than one model class (e.g. User, Post, Category)
    - I have included a User and Videogame model class.

[x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - I have included a User model that has_many Videogames.

[x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - I have included a Videogame model that belongs_to User.

[x] Include user accounts with unique login attribute (username or email)
    - Users create an account with an email and conditional logic in 'post /signup' looks for existing email before creating new account.

[x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    

[x] Ensure that users can't modify content created by other users
    - Users can create, edit, and delete only their Video Games.  When viewing Video Games that a different user created, they can only view the title, and date purchased.

[x] Include user input validations
    - Must have a unique email and requires a password to create an account. Validates a User is logged in to view video games, as well as creating, editing, and deleting your own video games. 

[x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - Display validation failures to user with error an message.

[x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - All README.md requirements are included.

Confirm

[x] You have a large number of small Git commits
    - Yes, it can be seen on my github.

[x] Your commit messages are meaningful
    - Yes, I made them meaningful and relative to the work done.

[x] You made the changes in a commit that relate to the commit message
    - Yes, the commit messages reflect the changes made.

[x] You don't include changes in a commit that aren't related to the commit message
    - Yes, it can be seen on my github.
 