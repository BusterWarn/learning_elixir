Code.require_file("fibonacci.exs", __DIR__)

defmodule Main do
  def run do
    case System.argv() do
      [arg] ->
        n = String.to_integer(arg)
        compute_and_output(n)
      _ ->
        Enum.map -3..10, fn n -> compute_and_output n end
    end
  end

  defp compute_and_output(n) do
    case Fibonacci.compute(n) do
      {:error, reason} -> IO.puts "Error for #{n} - reason: #{reason}"
      result -> IO.puts "Fibonacci for #{n} is #{result}"
    end
  end
end

Main.run()
