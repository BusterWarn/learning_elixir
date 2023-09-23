# Fibonacci with Elixir

## Introduction

Hey there! 👋 I'm learning Elixir, and this is one of my practice projects. In this program, I calculate the Fibonacci sequence up to a given number or for a specific number. If you're also new to Elixir or curious about it, feel free to dive in!

## Elixir Concepts Used

1. **Modules**: Both `Main` and `Fibonacci` are defined as Elixir modules.
2. **Function Definitions and Pattern Matching**: Functions in the `Fibonacci` module are defined multiple times with different patterns for argument matching.
3. **Guards**: The `when n > 1` and `when n < 0` in function definitions are guard clauses, allowing for additional conditions.
4. **Private Functions**: The `compute_and_output` function in the `Main` module is defined as a private function (`defp`).
5. **Pipelines**: The `|>` operator is used to chain function calls, although not heavily in this example.
6. **System.argv()**: Used for fetching command-line arguments.
7. **Case Statements**: Used for pattern matching on function return values and command-line arguments.
8. **Enum Module**: `Enum.map` is used for iterating through a range of numbers.
9. **String Interpolation**: Used in `IO.puts` for output.

## Running the Program

You can execute this program in two ways:

### Without an Argument

When run without any arguments, it will compute the Fibonacci sequence from -3 to 10 and display the output:

```bash
PS fibonacci> elixir .\main.exs
Error for -3 - reason: Input must be a non-negative integer
Error for -2 - reason: Input must be a non-negative integer
...
Fibonacci for 10 is 55
```

### With an Argument

You can also provide a specific number as an argument to only compute the Fibonacci sequence for that number:

```bash
PS fibonacci> elixir .\main.exs 9
Fibonacci for 9 is 34
```