# Bookcase Reading List Sinatra Application

# Overview

This Ruby Sinatra application provides users with a content management system for their reading lists. Each user can add new books (or stories) to their private bookcase, and these have a default status of "to read". The user can view their bookcase to see a list of all items, categorized by status, and access a link to each separate item. Items can be edited to change their status to "have read" or deleted from the bookcase altogether.

# Usage

To use the application, clone the repository, run rake db:migrate, and run shotgun to access it in your browser.

Each user must first create an account, which requires an email address, username, and password in order to access the other features.
