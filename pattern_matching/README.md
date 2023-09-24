Just practicing my [pattern matching](https://elixir-lang.org/getting-started/pattern-matching.html). Output:

```shell
PS pattern_matching> elixir .\main.exs
Integer: 1
Negative Integer: -1
String: Hello
Tail of a list without the first two elements: rld
Size 3 string: abc
Size 3 string: aö
Empty list
Two element list, last item: 2
Tail of a list without the first two elements: 4
Tail of a list without the first two elements: 35
Tuple: {1, 2, 3}
Mixed Tuple: {1, 2, 3}
Match all...

 ===== Lambda versions ===== 

Integer: 1
Negative Integer: -1
String: Hello
Tail of a list without the first two elements: rld
Size 3 string: abc
Size 3 string: aö
Empty list
Two element list, last item: 2
Tail of a list without the first two elements: 4
Tail of a list without the first two elements: 35
Tuple: {1, 2, 3}
Mixed Tuple: {1, 2, 3}
Match all...
```

It's unfortunate you cannot do something like

```elixir
defp func(list) when is_list(list) and Enum.all?(list, &is_binary(&1)), do: IO.puts "List of strings: #{list}"
```

Then you get:

```shell
error: invalid expression in guards, & is not allowed in guards. To learn more about guards, visit: https://hexdocs.pm/elixir/patterns-and-guards.html
  main.exs:27

** (CompileError) main.exs: cannot compile file (errors have been logged)
    (elixir 1.15.6) expanding macro: Kernel.and/2
```