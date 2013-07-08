require 'rails'

module Backbonejs
  module Generators
    class UninstallGenerator < ::Rails::Generators::Base
      desc "This generator uninstalls backbone.js, underscore.js, json2.js, and (optionally) icanhaz.js"
      class_option :keep, {
        :type => :array,
        :desc => 'Do not remove specified libraries',
        :banner => 'library another-library'
      }

      def remove_libraries
        ['backbone', 'underscore', 'json2', 'icanhaz'].each do |lib|
          unless [*options[:keep]].include?(lib)
            # Remove full and minified version of library
            file = "public/javascripts/#{lib}.js"
            remove_file file if File.exists?(file)
          end
        end
      end

      def remove_json_false
        remove_file 'config/initializers/backbone.rb'
      end
    end
  end
end

