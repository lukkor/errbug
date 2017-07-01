require "errbug/repository"

module Main
  module Persistence
    module Repositories
      class ExceptionRepo < Errbug::Repository[:exceptions]
        commands(:create)

        def for_index
          exceptions
            .listing
            .as(Main::Entities::Exception::WithEventsCount)
        end
      end
    end
  end
end
