require 'rails'
require 'curb'

module Backbonejs
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      @@backbone_version   = "0.3.3"
      @@underscore_version = "1.1.6"
      @@icanhaz_version = "0.9" 

      desc "This generator installs backbone.js #{@@backbone_version}, underscore.js #{@@underscore_version}, json2.js, and (optionally) icanhaz.js #{@@icanhaz_version}"
      class_option :ich, :type => :boolean, :default => false, :desc => "Include ICanHaz.js"
      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

      def fetch_libraries
        urls = {
          "backbone" => "http://documentcloud.github.com/backbone/backbone.js",
          "backbone.min" => "http://documentcloud.github.com/backbone/backbone-min.js",
          "underscore" => "http://documentcloud.github.com/underscore/underscore.js",
          "underscore.min" => "http://documentcloud.github.com/underscore/underscore-min.js",
          "json2" => "https://github.com/douglascrockford/JSON-js/raw/master/json2.js",
          "icanhaz" => "https://github.com/andyet/ICanHaz.js/raw/master/ICanHaz.js",
          "icanhaz.min" => "https://github.com/andyet/ICanHaz.js/raw/master/ICanHaz.min.js"
        }

        urls.each do |url|
          file_url = url[1]
          file_name = url[0]     
          new_file = "public/javascripts/#{file_name}.js"

          
          #begin         
          #   c = Curl::Easy.new(file_url)
          #   c.perform
          # 
          #   if File.exist?(new_file)  
          #     puts "Skipping #{file_name}.js because it already exists"  
          #   else  
          #     puts "Generating #{new_file}"  
          #     create_file new_file
          #     append_to_file new_file, c.body_str
          #   end
          # 
          # rescue
          #   puts "Connection to #{the_url} failed!"
          #   puts "Falling back to copying over a, most likely, older version."
            
            say_status("copying", "#{file_name}.js", :green)
            copy_file "#{file_name}.js", "public/javascripts/#{file_name}.js"
         # end

        end
      end

      def copy_json_false
        backbone_rb =  "config/initializers/backbone.rb"
        create_file backbone_rb
        say_status("creating", "backbone.rb - excludes root in json return just like Backbone likes it.", :green)
        append_to_file backbone_rb, "ActiveRecord::Base.include_root_in_json = false"
        #copy_file "backbone.js", "public/javascripts/jquery.js"
      end

    end
  end
end
