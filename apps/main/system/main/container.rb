require "pathname"
require "dry/web/container"

module Main
  class Container < Dry::Web::Container
    require root.join("system/errbug/container")
    import Errbug::Container

    configure do |config|
      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze

      config.logger = Errbug::Container[:logger]

      config.default_namespace = "main"

      config.auto_register = %w[
        lib/main
      ]
    end

    load_paths! "lib", "system"
  end
end
