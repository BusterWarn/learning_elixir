defmodule Main do

  @spec make_names_cool([Names.maybe_string]) :: [Names.maybe_string]
  def make_names_cool(names) do
    names
    |> Enum.map(&Names.to_lower_case/1)
    |> Enum.map(&Names.to_snake_case/1)
    |> Enum.map(&Names.add_cool_prefix/1)

    # Alternative way
    #Enum.map names, fn name ->
    #  name
    #    |> Names.to_lower_case
    #    |> Names.to_snake_case
    #    |> Names.add_cool_prefix
    #end
  end

  @spec cat_maybes([Names.maybe_string]) :: [String.t()]
  def cat_maybes(names) do
    Enum.reject(names, fn x -> x == :nothing end)
  end
end

names = [
  "my name",
  "carl christian",
  "Elon1 musk",
  "Mary",
  "Alice Wonderland",
  "Robert Downey",
  "Chandler Bing",
  "Joey",
  "Clark Kent",
  "John Doe"
]

IO.puts names
  |> Main.make_names_cool
  |> Main.cat_maybes
  |> Enum.join("\n")
