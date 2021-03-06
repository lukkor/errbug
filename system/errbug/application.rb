require "dry/web/roda/application"
require_relative "container"

module Errbug
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
    end

    route do |r|
      r.run Main::Application.freeze.app
    end
  end
end
