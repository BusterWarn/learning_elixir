defmodule PingPong do
  @default_wait_time 1_000
  @game_finish 11

  def ready(wait_time \\ @default_wait_time) do
    receive do
      {_sender, _action, @game_finish} ->
        IO.puts "12, I (#{inspect player_pid()}) have decided to stop playing."
        ready()
      {sender, action, turn} ->
        case action do
          :ping -> hit_to(sender, :pong, turn + 1)
          :pong -> hit_to(sender, :ping, turn + 1)
        end
        ready()
    after
      wait_time -> IO.puts "#{inspect player_pid()}...Timed out."
    end
  end

  def hit_to(opponent_id, action, turn) do
    IO.puts "#{turn}, hit_to: #{inspect opponent_id}, #{inspect action}"
    send(opponent_id, {player_pid(), action, turn})
  end

  defp player_pid, do: self()
end

defmodule Main do
  def run do
    player_1 = self()
    {result, player_2} = PingPong |> Task.start(:ready, [])

    case result do
      :ok ->
        IO.puts "player_1: #{inspect player_1}"
        IO.puts "player_2: #{inspect player_2}"

        PingPong.hit_to(player_2, :ping, 0)
        PingPong.ready()
      :err ->
        raise "Could not create player_2 process."
      _ ->
        IO.puts "Unexpected stuff is happening"
    end
  end
end

Main.run()
