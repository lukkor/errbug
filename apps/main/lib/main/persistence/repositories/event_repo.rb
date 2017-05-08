require "errbug/repository"

module Main
  module Persistence
    module Repositories
      class EventRepo < Errbug::Repository[:events]
        commands(:create)
      end
    end
  end
end
