defmodule PhoenixWithSqlite3.Counter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "counters" do
    field :count, :integer
  end

  @doc false
  def changeset(counter, attrs) do
    counter
    |> cast(attrs, [:count])
    |> validate_required([:count])
  end
end
