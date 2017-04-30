require "dry/web/umbrella"
require_relative "settings"

module Errbug
  class Container < Dry::Web::Umbrella
    configure do
      config.name = :core
      config.settings_loader = Errbug::Settings
      config.listeners = true
    end

    load_paths! "lib", "system"

    def self.settings
      config.settings
    end
  end
end
