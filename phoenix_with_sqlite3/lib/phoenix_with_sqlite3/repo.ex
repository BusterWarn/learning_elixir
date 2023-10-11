defmodule PhoenixWithSqlite3.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_with_sqlite3,
    adapter: Ecto.Adapters.SQLite3
end
