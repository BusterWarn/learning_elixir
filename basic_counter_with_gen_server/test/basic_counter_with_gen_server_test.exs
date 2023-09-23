defmodule CounterTest do
  use ExUnit.Case

  test "increments the counter" do
    {:ok, pid} = Counter.start_link()
    Counter.increment(pid, :counter_1)
    Counter.increment(pid, :counter_1)
    assert Counter.value(pid, :counter_1) === 2
    assert Counter.value(pid, :counter_2) === 0
  end

  test "decrements the counter" do
    {:ok, pid} = Counter.start_link()
    Counter.decrement(pid, :counter_1)
    Counter.decrement(pid, :counter_1)
    assert Counter.value(pid, :counter_1) === -2
    assert Counter.value(pid, :counter_2) === 0
  end

  test "Wrong counter should return error" do
    {:ok, pid} = Counter.start_link()
    assert {:error, _} = Counter.increment(pid, :counter_3)
    assert {:error, _} = Counter.decrement(pid, :counter_3)
    assert {:error, _} = Counter.value(pid, :counter_3)
  end
end
