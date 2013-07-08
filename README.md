Installation
------------

Add the following to your Gemfile:
    
    gem "backbonejs-rails", "~> 1.0.0"

Then use Bundler to install:

    $ bundle install

Usage
-------

    $ rails g backbonejs:install

Optionally you can add -ich to the end of that command to have icanhaz.js included.


What Does it do?
================

backbonejs-rails adds the necessary libraries to your Rails app for using [Backbone.js](http://backbonejs.org).

* backbone.js
* underscore.js
* json2.js

For templates you can optionally include [ICanHaz.js](http://icanhazjs.com/)

    $ rails g backbonejs:install -ich 


    
Outdated Screencast? Yep I have one.
----------

You can find my [screencast on Backbone.js and Rails 3 here](http://andrewgertig.com/2011/05/rails-backbone-js-example-screencast/)

