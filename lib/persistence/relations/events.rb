module Persistence
  module Relations
    class Events < ROM::Relation[:sql]
      schema(:events) do
        attribute(:id, Types::PG::UUID.meta(primary_key: true))
        attribute(:exception_id, Types::PG::UUID.meta(foreign_key: true, relation: :events))
        attribute(:env, Types::Strict::String)
        attribute(:meta, Types::PG::JSONB.optional)
        attribute(:created_at, Types::Time)

        associations do
          belongs_to(:exception)
        end
      end

      def by_id(id)
        where(id: id).one!
      end

      def by_env(env)
        where(env: env)
      end
    end
  end
end
