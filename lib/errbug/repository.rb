require "rom-repository"
require "errbug/container"
require "errbug/import"

Errbug::Container.boot! :rom

module Errbug
  class Repository < ROM::Repository::Root
    include Errbug::Import.args["persistence.rom"]
  end
end
