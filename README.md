Installation
------------

Add the following to your Gemfile:
    
    gem "backbonejs-rails", "~> 0.0.6"

Then use Bundler to install:

    $ bundle install

Usage
-------

    $ rails g backbonejs:install

Optionally you can add -ich to the end of that command to have icanhaz.js included.


What Does it do?
================

Rails 3.1
---------

backbonejs-rails adds the necessary libraries to your Rails app for using [backbone.js](http://documentcloud.github.com/backbone/). Also, under your assets/javascripts folder it will create the following folder structure:

    /backone
      /models
      /routers
      /views

The gem includes the following files in its vendor/assets/javascripts folder, which means you can use any of them in your application.js file by adding something like 

    //= require underscore 
    
after this line:

    //= require jquery


* backbone.js
* underscore.js
* icanhaz.js
* json2.js

Rails 3.0
---------

backbonejs-rails is similar to [jquery-rails](https://github.com/JangoSteve/jquery-rails). It adds the Javascript files that you need to create an application that uses [backbone.js](http://documentcloud.github.com/backbone/) as a JavaScript MVC. This gem will get the most recent version of these files from their master branches on github.

These are:

* backbone.js
* backbone.min.js
* underscore.js
* underscore.min.js
* json2.js

For templates I have included [ICanHaz.js](http://icanhazjs.com/) which you can optionally include by doing the following

    $ rails g backbonejs:install -ich 

* icanhaz.js
* icanhaz.min.js

Upon installation the files are added to your javascript defaults so that you can still use the following in your views/layouts/application.html.erb file:

    <%= javascript_include_tag :defaults %>
    
What else?
----------

It also creates a file called "config/initializers/backbone.rb" which contains the line:

    ActiveRecord::Base.include_root_in_json = false
    
Which is what you need to return JSON to Backbone the way it likes it. Otherwise you would need to do something like this:
    
    def create
        render :json => Person.create(:name => params[:name], :age => params[:age])
    end

You can find my [screencast on Backbone.js and Rails 3 here](http://andrewgertig.com/2011/05/rails-backbone-js-example-screencast/)

