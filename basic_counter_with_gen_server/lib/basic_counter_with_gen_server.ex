defmodule Counter do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 0)
  end

  # Client API
  def increment(pid, counter_name) do
    GenServer.call(pid, {:increment, counter_name})
  end

  def decrement(pid, counter_name) do
    GenServer.call(pid, {:decrement, counter_name})
  end

  def value(pid, counter_name) do
    GenServer.call(pid, {:value, counter_name})
  end

  # Server Callbacks
  def init(initial_value) do
    {:ok, %{counter_1: initial_value, counter_2: initial_value}}
  end

  def handle_call({:increment, counter_name}, _from, state) do
    case Map.get(state, counter_name) do
      nil -> {:reply, {:error, "No counter named '#{counter_name}'"}, state}
      count ->
        new_state = Map.put(state, counter_name, count + 1)
        {:reply, count + 1, new_state}
    end
  end

  def handle_call({:decrement, counter_name}, _from, state) do
    case Map.get(state, counter_name) do
      nil -> {:reply, {:error, "No counter named '#{counter_name}'"}, state}
      count ->
        new_state = Map.put(state, counter_name, count - 1)
        {:reply, count - 1, new_state}
    end
  end

  def handle_call({:value, counter_name}, _from, state) do
    case Map.get(state, counter_name) do
      nil -> {:reply, {:error, "No counter named '#{counter_name}'"}, state}
      count -> {:reply, count, state}
    end
  end

end
