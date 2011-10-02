require 'rails/generators/base'

module Backbonejs
  module Rails #Generators
    if ::Rails.version < "3.1"
      require 'backbonejs-rails/railtie'
    else
      require 'backbonejs-rails/engine'
    end
    require 'backbonejs-rails/version'
  end
end