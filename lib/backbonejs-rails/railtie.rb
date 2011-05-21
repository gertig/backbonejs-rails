module Backbonejs
  module Rails

    class Railtie < ::Rails::Railtie
      config.before_configuration do

        js_defaults = ::Rails.env.production? ? %w(json2 underscore.min backbone.min icanhaz.min) : %w(json2 underscore backbone icanhaz)

        # Merge the jQuery scripts, remove the Prototype defaults and finally add 'rails'
        # at the end, because load order is important
        config.action_view.javascript_expansions[:defaults] |= js_defaults
      end
    end

  end
end