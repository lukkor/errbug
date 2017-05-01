require "errbug/repository"

module Main
  module Persistence
    module Repositories
      class ExceptionRepo < Errbug::Repository[:exceptions]
        commands :create

        def by_id(id)
          exceptions.by_id(id).one!
        end
      end
    end
  end
end
