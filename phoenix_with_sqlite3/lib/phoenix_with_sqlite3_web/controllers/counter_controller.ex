defmodule PhoenixWithSqlite3Web.CounterController do

  use PhoenixWithSqlite3Web, :controller

  alias PhoenixWithSqlite3.Counter  # replace with your schema alias
  alias PhoenixWithSqlite3.Repo     # replace with your repo alias

  def get_count(conn, _data) do

      case Repo.get(Counter, 1) do
        nil ->
          # Counter not found; insert one and set count to 1
          changeset = Counter.changeset(%Counter{}, %{count: 1})
          {:ok, new_counter} = Repo.insert(changeset)
          json(conn, %{id: 1, value: new_counter.count})
        %Counter{} = database_item ->
          new_count = database_item.count + 1
          changeset = Counter.changeset(database_item, %{count: new_count})
          Repo.update(changeset)
          json(conn, %{id: database_item.id, value: new_count})
      end
  end
end
