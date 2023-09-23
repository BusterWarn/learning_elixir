defmodule Names do

  @type maybe_string :: :nothing | String.t()

  @spec contains_number?(String.t()) :: boolean
  defp contains_number?(text) do
    regex = ~r/\d/
    matches = Regex.scan(regex, text)
    Enum.any?(matches, fn match -> match end)
  end

  @spec contains_one_space?(String.t()) :: boolean
  defp contains_one_space?(text) do
    length(Regex.scan(~r/ /, text)) == 1
  end

  @spec split_name(maybe_string) :: :nothing | {String.t(), String.t()}
  defp split_name(:nothing), do: :nothing
  defp split_name(name) do
    if contains_one_space? name do
      full_name = String.split(name, " ")
      {hd(full_name), hd(tl(full_name))}
    else
      :nothing
    end
  end

  @spec to_lower_case(maybe_string) :: maybe_string
  def to_lower_case(:nothing), do: :nothing
  def to_lower_case(name) do
    case contains_number?(name) do
      true -> :nothing
      false -> String.downcase name
    end
  end

  @spec to_snake_case(maybe_string) :: maybe_string
  def to_snake_case(:nothing), do: :nothing
  def to_snake_case(full_name) do
    case split_name full_name do
      :nothing -> :nothing
      {first_name, last_name} -> first_name <> "_" <> last_name
    end
  end

  @spec add_cool_prefix(maybe_string) :: maybe_string
  def add_cool_prefix(:nothing), do: :nothing
  def add_cool_prefix("c" <> _rest), do: :nothing
  def add_cool_prefix(name), do: "cool_" <> name

end
