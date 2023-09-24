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
    func([1, 2, 3, "4", 5])
    func(["1", "2", "3", 4, "5"])
    func({1, 2, 3})
    func({1, "2", 3})
    func({1, 2, 3, 4})

    lambda = fn
      n when is_integer(n) and n < 0                    -> IO.puts "Negative Integer: #{n}"
      n when is_integer(n)                              -> IO.puts "Integer: #{n}"
      str when is_binary(str) and byte_size(str) === 3  -> IO.puts "Size 3 string: #{str}"
      str when is_binary(str)                           -> IO.puts "String: #{str}"
      []                                                -> IO.puts "Empty list"
      [_, last]                                         -> IO.puts "Two element list, last item: #{last}"
      [_, _ | tail]                                     -> IO.puts "Tail of a list without the first two elements: #{tail}"
      list when is_list(list)                           -> IO.puts "Any list: #{list}"
      {a, b, c} when is_binary(b)                       -> IO.puts "Mixed Tuple: {#{a}, #{b}, #{c}}"
      {a, b, c}                                         -> IO.puts "Tuple: {#{a}, #{b}, #{c}}"
      _                                                 -> IO.puts "Match all..."
    end

    IO.puts "\n ===== Lambda versions ===== \n"

    lambda.(1)
    lambda.(-1)
    lambda.("Hello")
    lambda.('World')
    lambda.("abc")
    lambda.("aö")
    lambda.([])
    lambda.([1, 2])
    lambda.([1, 2, 3, "4", 5])
    lambda.(["1", "2", "3", 4, "5"])
    lambda.({1, 2, 3})
    lambda.({1, "2", 3})
    lambda.({1, 2, 3, 4})
  end

  defp func(n) when is_integer(n) and n < 0,                    do: IO.puts "Negative Integer: #{n}"
  defp func(n) when is_integer(n),                              do: IO.puts "Integer: #{n}"
  defp func(str) when is_binary(str) and byte_size(str) === 3,  do: IO.puts "Size 3 string: #{str}"
  defp func(str) when is_binary(str),                           do: IO.puts "String: #{str}"
  defp func([]),                                                do: IO.puts "Empty list"
  defp func([_, last]),                                         do: IO.puts "Two element list, last item: #{last}"
  defp func([_, _ | tail]),                                     do: IO.puts "Tail of a list without the first two elements: #{tail}"
  defp func(list) when is_list(list),                           do: IO.puts "Any list: #{list}"
  defp func({a, b, c}) when is_binary(b),                       do: IO.puts "Mixed Tuple: {#{a}, #{b}, #{c}}"
  defp func({a, b, c}),                                         do: IO.puts "Tuple: {#{a}, #{b}, #{c}}"
  defp func(_),                                                 do: IO.puts "Match all..."

end

Main.run()

# Pin operator pattern matching. No output but does work. #&Names.add_cool_prefix/1
x = 2
2 = x
^x = 2

list = [x, 2, 3]
[2, 2, 3] = list
^list = [2, 2, 3]

{a, b, c} = {7, 8, 9}
{_, 8, _} = {a, b, c}
{^a, _, ^c} = {7, 8, 9}

tuple = {7, 8, 9}
{_, 8, _} = tuple
^tuple = {7, 8, 9}

# Valid.
3 = length([10, [100], 1])
# Not valid.
# length([10, [100], 1]) = 3
