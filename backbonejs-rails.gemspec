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
  s.description = %q{This gem is noth Rails 3.1+ and Rails 3.0.x compatible. It creates the following files in public/javasripts: backbone.js, underscore.js, json2.js, and optionally icanhaz.js for templates. It also creates an initializer that fixes the way Rails returns JSON to Backbone.js}

  s.rubyforge_project = "backbonejs-rails"
  
  s.add_dependency "railties", "~> 3.0"
  s.add_dependency "thor",     "~> 0.14"
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "rails",   "~> 3.0"
  s.add_development_dependency "rake",   "~> 0.8.7"
  

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end


#Updating the gem from Railscast 245

# 1. Make necessary changes, then do git commit
# 2. Bump the version number in lib/backbonejs-rails/version.rb
# 3. Bump the version numbers for the js files you change in lib/generators/backbonejs/install/install_generator.rb
# 4. Bump the version number in the README.md
# 5. $ gem build backbonejs-rails.gemspec
# 6. $ gem push backbonejs-rails-0.0.X.gem
# 7. Rejoice
