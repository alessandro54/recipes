# README

[![Recipes CI](https://github.com/alessandro54/recipes/actions/workflows/test.yml/badge.svg)](https://github.com/alessandro54/recipes/actions/workflows/test.yml)

This application is a recipe manager, which features a calendar to plan your meals, also works as a recipe book, where you can store your recipes and share them with other users. (WIP) The name for the moment is 'Recipes' but is more a codename.

Features:

* Github Actions CI for Lint and Tests
* Docker (soon)
* User authentication
* Recipe CRUD
* Main-flow tests with RSpec and Cucumber

## Tools

* Ruby 3.2.2
* Rails 7.0.7
* Postgres 13.11
* Yarn 1.22.19
* Typescript 5.1.6
* Lit 2.7.5

## Local installation

* Clone the repo
* Install ruby dependencies

```bash
bundle install
```

* Install JS dependencies

```bash
yarn install
```

* Create the database and run the migrations

```bash
rails db:setup
```

* Run the server on [localhost:3000](http://localhost:3000)

```bash
./bin/dev
```

* Run the tests

```bash
./bin/rake
```

## Docker Setup (soon)
