ROM::SQL.migration do
  change do
    run 'CREATE EXTENSION "uuid-ossp"'
    create_enum(:severity_type, %w(error warning info))
    create_table(:exceptions) do
      uuid(:id, default: Sequel.function(:uuid_generate_v4), primary_key: true)
      String(:error_class, null: false)
      String(:message, null: false)
      Jsonb(:stacktrace)
      severity_type(:severity, null: false)
      DateTime(:created_at, null: false, default: Sequel::CURRENT_TIMESTAMP)
    end
  end
end
