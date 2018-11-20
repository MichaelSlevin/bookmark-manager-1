# Bookmark Manager

## User Stories

```
As a user,
So I can revisit a website quickly,
I would like to see a list of bookmarks.
```

## Domain Model

![Bookmark Manager domain model](/public/images/bookmark_manager.jpg)

## Getting started

In terminal, in the directory where you would like this project:

`git clone git@github.com:alittlecross/bookmark-manager.git`

In terminal, in the directory for this project, type:

`bundle`

## Database Setup

Connect to `psql` and run the SQL scripts:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

Then run the SQL scripts in the `db/migrations` folder in the given order.

## Usage

`rackup config.ru`

Then in a browser of your choice, go to:

`http://localhost:9292/`

The user should then continue in browser.

## Running tests

`rspec`

## Running linter

`rubocop`
