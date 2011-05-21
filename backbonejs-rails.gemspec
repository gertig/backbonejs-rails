# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "backbonejs-rails/version"

Gem::Specification.new do |s|
  s.name        = "backbonejs-rails"
  s.version     = Backbonejs::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Gertig"]
  s.email       = ["andrew.gertig@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Provide files needed for using Backbone.js}
  s.description = %q{This gem works with Rails 3.0.x. It creates the following files in public/javasripts: backbone.js, underscore.js, json2.js, and optionally icanhaz.js for templates. It also creates an initializer that fixes the way Rails returns JSON to Backbone.js}

  s.rubyforge_project = "backbonejs-rails"
  
  s.add_dependency "railties", "~> 3.0"
  s.add_dependency "thor",     "~> 0.14"
  s.add_dependency "curb",     "~> 0.7.15"
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "rails",   "~> 3.0"
  s.add_development_dependency "rake",   "~> 0.8.7"
  

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
