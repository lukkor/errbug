ROM::SQL.migration do
  change do
    create_table(:events) do
      uuid(:id, default: Sequel.function(:uuid_generate_v4), primary_key: true)
      foreign_key(:exception_id, :exceptions, type: 'uuid')
      Jsonb(:meta)
      String(:env, null: false)
      DateTime(:created_at, null: false, default: Sequel::CURRENT_TIMESTAMP)
    end
  end
end
