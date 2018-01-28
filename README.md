# Bookcase Reading List Sinatra Application

# Overview

This Ruby Sinatra application provides users with a content management system for their reading lists. Each user can add new books (or stories) to their private bookcase, and these have a default status of "to read". The user can view their bookcase to see a list of all items, categorized by status, and access a link to each separate item. Items can be edited to change their status to "have read" or deleted from the bookcase altogether.

# Usage

To use the application, clone the repository, run <code>rake db:migrate</code>, and run <code>shotgun</code> to access it in your browser.

Each user must first create an account, which requires an email address, username, and password in order to access the other features.

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/millervm/bookcase_reading_list. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


# License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
