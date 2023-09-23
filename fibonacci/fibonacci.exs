defmodule Fibonacci do
  @spec compute(integer) :: integer | {:error, String.t()}
  def compute(0), do: 0
  def compute(1), do: 1
  def compute(n) when n > 1, do: compute(n - 1) + compute(n - 2)
  def compute(n) when n < 0, do: {:error, "Input must be a non-negative integer"}
end
