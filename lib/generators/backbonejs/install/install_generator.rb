require 'rails'
require 'net/http'
require 'uri'


module Backbonejs
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      
      desc "This generator installs backbone.js, underscore.js, and json2.js"
      source_root File.expand_path('../javascripts', __FILE__)
      # class_option :ich, :type => :boolean, :aliases => "-i", :default => false, :desc => 'Include ICanHaz.js'

      # Copy backbone, underscore, json2 to assets folder
      def copy_backbone
        copy_file "backbone.js", "app/assets/javascripts/backbone.js"
        copy_file "underscore.js", "app/assets/javascripts/underscore.js"
        copy_file "json2.js", "app/assets/javascripts/json2.js"
      end
      
      def insert_backbone_in_applicationjs
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require json2\n//= require underscore\n//= require backbone\n"
        end
      end
      
      # def create_dir_layout
      #   %W{routers models views}.each do |dir|
      #     empty_directory "app/assets/javascripts/backbone/#{dir}" 
      #   end
      # end
      
    end
  end
end