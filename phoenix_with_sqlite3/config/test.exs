import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_with_sqlite3, PhoenixWithSqlite3.Repo,
  database: Path.expand("../phoenix_with_sqlite3_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_with_sqlite3, PhoenixWithSqlite3Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "DE+pvLtbVFW0b4KVW107Jpho0PjrBmllvjhXsxjfd2OzBiRnC8Kd+YAMt+87kzfM",
  server: false

# In test we don't send emails.
config :phoenix_with_sqlite3, PhoenixWithSqlite3.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
