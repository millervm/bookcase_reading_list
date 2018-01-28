# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    The app relies on the Sinatra framework.
- [x] Use ActiveRecord for storing information in a database
    The models and database migrations inherit from ActiveRecord models for content management.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
    The application has two models: User and Book.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
    Each User instance "has_many" books.
- [x] Include user accounts
    Features are only available to users who create accounts and access the application while logged into their accounts. The accounts are password-protected.
- [x] Ensure that users can't modify content created by other users
    Each user can only edit and delete the Book instances that belong to their account.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Each Book (which "belongs_to" a specific User) can be created/added, read/viewed, updated/edited, and destroyed/removed by the User who created it. There are forms for creating, editing, and deleting the item, and a Book-specific page displays the Book's details.
- [x] Include user input validations
    Any empty entries ("" for username, password, book title, etc.) are invalid, and an authentication process is used during account login.
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  README file contains a description of the application, instructions for installation and use, and contributor and license details.

Confirm
- [x] You have a large number of small Git commits
    Multiple Git commits were made to add new changes throughout the coding process.
- [x] Your commit messages are meaningful
    Commit messages were brief descriptions of the relevant changes.
- [x] You made the changes in a commit that relate to the commit message
    The commit messages were specific to the changes that were being made.
- [x] You don't include changes in a commit that aren't related to the commit message
    Changes were addressed in the corresponding commit messages.
