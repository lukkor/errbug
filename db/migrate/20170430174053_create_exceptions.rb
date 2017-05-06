require "types"

ROM::SQL.migration do
  up do
    run('CREATE EXTENSION "uuid-ossp"')
    create_enum(:severity_type, Types::Severity.values)
    create_enum(:status_type, Types::Status.values)
    create_table(:exceptions) do
      uuid(:id, default: Sequel.function(:uuid_generate_v4), primary_key: true)
      String(:error_class, null: false)
      String(:message, null: false)
      Jsonb(:stacktrace)
      severity_type(:severity, null: false)
      status_type(:status, null: false)
      DateTime(:created_at, null: false, default: Sequel::CURRENT_TIMESTAMP)
    end
  end

  down do
    drop_table(:exceptions)
    drop_enum(:severity_type)
    drop_enum(:status_type)
    run('DROP EXTENSION IF EXISTS "uuid-ossp"')
  end
end
