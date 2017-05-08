module Persistence
  module Relations
    class Exceptions < ROM::Relation[:sql]
      schema(:exceptions) do
        attribute(:id, Types::PG::UUID.meta(primary_key: true))
        attribute(:error_class, Types::String)
        attribute(:message, Types::String)
        attribute(:stacktrace, Types::PG::JSONB.optional)
        attribute(:severity, Types::String)
        attribute(:status, Types::String)
        attribute(:created_at, Types::Time)

        associations do
          has_many(:events)
        end
      end

      def listing
        left_join(:events)
          .select { [id, int::count(id).as(:events_count)] }.group(:id)
          .select_append { [error_class, message, severity, status, created_at.qualified] }
      end
    end
  end
end
