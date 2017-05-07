module Persistence
  module Relations
    class Exceptions < ROM::Relation[:sql]
      schema(:exceptions) do
        attribute(:id, Types::PG::UUID.meta(primary: true))
        attribute(:error_class, Types::String)
        attribute(:message, Types::String)
        attribute(:stacktrace, Types::PG::JSONB.optional)
        attribute(:severity, Types::String)
        attribute(:created_at, Types::Time)

        associations do
          has_many :events
        end
      end

      dataset do
        order(:created_at)
      end

      def by_id(id)
        where(id: id)
      end

      def by_severity(severity)
        where(severity: severity)
      end
    end
  end
end
