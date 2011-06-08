require 'rails'
require 'net/http'
require 'uri'

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
          "json2" => "https://raw.github.com/douglascrockford/JSON-js/master/json2.js"
        }

        if options[:ich]
          urls.merge!(
            "icanhaz" => "https://raw.github.com/andyet/ICanHaz.js/master/ICanHaz.js",
            "icanhaz.min" => "https://raw.github.com/andyet/ICanHaz.js/master/ICanHaz.min.js"
          )
        end

        urls.each do |file_name, file_url|
          new_file = "public/javascripts/#{file_name}.js"

          say_status('download', file_url, :green)
          begin
            url = URI.parse(file_url)
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true if url.scheme == 'https'

            request = Net::HTTP::Get.new(url.request_uri)
            response = http.request(request)

            case response
            when Net::HTTPSuccess
              # No need to check if file already exists.
              # Generator detects conflict and asks for action.
              create_file new_file
              append_to_file new_file, response.body
            else
              res.error!
            end

          rescue
            say_status('failed', "Downloading #{file_url} failed", :red)
            say_status('copying', "#{file_name}.js (from local copy)", :green)
            copy_file "#{file_name}.js", "public/javascripts/#{file_name}.js"
          end
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
