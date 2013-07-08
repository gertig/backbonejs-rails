require 'rails'
require 'net/http'
require 'uri'


module Backbonejs
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      @@backbone_version   = '0.9.1'
      @@underscore_version = '1.3.1'
      @@icanhaz_version = '0.10'
      
      desc "This generator installs backbone.js #{@@backbone_version}, underscore.js #{@@underscore_version}, json2.js, and (optionally) icanhaz.js #{@@icanhaz_version}"
      class_option :ich, :type => :boolean, :aliases => "-i", :default => false, :desc => 'Include ICanHaz.js'
      
      def insert_backbone_in_applicationjs
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require json2\n//= require underscore\n//= require backbone\n"
        end
        
        if options[:ich]
          inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
            "//= require icanhaz\n"
          end
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