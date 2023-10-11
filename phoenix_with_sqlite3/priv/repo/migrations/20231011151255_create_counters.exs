defmodule PhoenixWithSqlite3.Repo.Migrations.CreateCounters do
  use Ecto.Migration

  def change do
    create table(:counters) do
      add :count, :integer
    end
  end
end
