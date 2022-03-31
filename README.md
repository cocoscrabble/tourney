# Tourney: A Scrabble Tournament Manager

Still a work in progress. To get it up and running:

* Install prerequisites:
  * ruby-3.0.2, e.g. via [rbenv](https://github.com/rbenv/rbenv)
  * [bundler](https://bundler.io/)
  * [foreman](https://rubygems.org/gems/foreman/versions/0.87.2)
  * [npm](https://www.npmjs.com/)
* Check out and initialize the repository
```
$ git clone https://github.com/cocoscrabble/tourney
$ cd tourney
$ bundle install
$ npm install
$ rake db:migrate
```
* Start the dev server
```
$ bin/dev
```
