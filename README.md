What Does it do?
----------------

Compatible with Rails 3.0.x (Rails 3.1.x support is coming).

backbonejs-rails is similar to jquery-rails. It adds the Javascript files that you need to create an application that uses backbone.js as a JavaScript MVC. This gem will get the most recent version of these files from their master branches on github.

These are:

* backbone.js
* backbone.min.js
* underscore.js
* underscore.min.js
* json2.js

For templates I have included ICanHaz.js

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

Installation
------------

The best way to install backbonejs-rails is by adding the following to your Gemfile:
    gem "jquery-rails"
    gem "backbonejs-rails"

Then use Bundler to install:

    $ bundle install

Usage
-------

    $ rails g jquery:install
    $ rails g backbonejs:install

If you have already installed jquery and removed prototype then you can skip that step.

You can find my [screencast on Backbone.js and Rails 3 here](http://andrewgertig.com/2011/05/rails-backbone-js-example-screencast/)

