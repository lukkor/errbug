require "types"

module Main
  module Entities
    class Exception < Dry::Struct
      attribute(:error_class, Types::Strict::String)
      attribute(:message, Types::Strict::String)
      attribute(:severity, Types::Severity)
      attribute(:status, Types::Status)
    end
  end
end
