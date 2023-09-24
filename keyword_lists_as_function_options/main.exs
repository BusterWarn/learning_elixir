defmodule Main do
  def run do
    # Example from Elixir course Lecture 15
    cook = fn (heat, foods) -> Keyword.values(foods) |> Enum.map(&(heat<>&1<>"\n")) end
    IO.puts cook.("deep fried ", [meat: "hamburger", veggies: "taters", pizza: "pizza"])

    IO.puts cook_food(["pizza", "cheese"], sauce: "garlic", topping: "basil", joiner: "with")
    IO.puts cook_food(["ice cream", "brownes", "popcorn"], im_hungry_now: "mmm foood")
    IO.puts cook_food(["pasta", "meatballs"])

  end

  defp cook_food(uncooked_foods, options \\ [sauce: "ketchup"]) do

    Enum.each options, fn
      {:joiner, value} ->
        IO.puts("Option joiner: #{value}")
      {:sauce, value} ->
        IO.puts("Option sauce: #{value}")
      {:topping, value} ->
        IO.puts("Option topping: #{value}")
      {key, value} ->
        IO.puts("Unknown option #{key}: #{value}")
    end

    join_with = Keyword.get(options, :joiner, "and")
    somewhat_cooked_food = Enum.join(uncooked_foods, " #{join_with} ")

    "Today we are serving " <> Enum.reduce(options, somewhat_cooked_food, fn option, acc ->
      case handle_option(option) do
        {:prepend, str} -> str <> acc
        {:append, str} -> acc <> str
        {:err, _str} -> acc
      end
    end) <> "\n"
  end

  defp handle_option({:sauce, value}) do
    {:prepend, "a nice #{value} sauce, some "}
  end

  defp handle_option({:topping, value}) do
    {:append, " and a sprinkle of #{value}"}
  end

  defp handle_option({key, value}) do
    {:err, "Unknown option: #{key} with value: #{value}"}
  end

end

Main.run()
