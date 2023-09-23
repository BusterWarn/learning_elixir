defmodule Main do

  def run do
    func(1)
    func(-1)
    func("Hello")
    func('World')
    func("abc")
    func("aö")
    func([])
    func([1, 2])
    func([1, 2, 3, 4, 5])
    func({1, 2, 3})
    func({1, "2", 3})
    func({1, "2", 3, 4})
    func({1, "2", 3, 4, 5, 6, 7, 8})
  end

  defp func(n) when is_integer(n) and n < 0, do: IO.puts "Negative Integer: #{n}"
  defp func(n) when is_integer(n), do: IO.puts "Integer: #{n}"
  defp func(str) when is_binary(str) and byte_size(str) === 3, do: IO.puts "Size 3 string: #{str}"
  defp func(str) when is_binary(str), do: IO.puts "String: #{str}"
  defp func(list) when is_list(list), do: IO.puts "List: #{list}"
  defp func([]), do: IO.puts "Empty list"
  defp func([_, last]), do: IO.puts "Two element list, last item: #{last}"
  defp func([_, _ | tail]), do: IO.puts "Tail of a list without the first two elements: #{tail}"
  defp func({a, b, c}) when is_binary(b), do: IO.puts "Mixed Tuple: {#{a}, #{b}, #{c}}"
  defp func({a, b, c}), do: IO.puts "Tuple: {#{a}, #{b}, #{c}}"
  defp func(_), do: IO.puts "Match all..."
end

Main.run()
