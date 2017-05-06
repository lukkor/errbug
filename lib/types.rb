require "dry-struct"
require "dry-types"

module Types
  include Dry::Types.module

  Severity = Types::Strict::String.default('error').enum('error', 'info', 'warning')
  Status = Types::Strict::String.default('open').enum('open', 'new', 'fixed', 'snoozed')
end
