module Backbonejs
  module Rails

    class Railtie < ::Rails::Railtie
      config.before_configuration do

        js_defaults = ::Rails.env.production? ? %w(underscore.min backbone.min json2 icanhaz.min) : %w(underscore backbone json2 icanhaz)

        # Merge the jQuery scripts, remove the Prototype defaults and finally add 'rails'
        # at the end, because load order is important
        config.action_view.javascript_expansions[:defaults] |= js_defaults
        #config.action_view.javascript_expansions[:defaults] << 'icanhaz'
      end
    end

  end
end