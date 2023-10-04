defmodule Caesar do
  def main(argv) do
    argv
      |> parse_args
      |> process_args
    System.halt(0)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean])
    case parse do
      {[help: true], _, _} -> {:help}
      {[shift: shift], ["encrypt", string], _} -> {:encrypt, string, shift |> String.to_integer}
      _ -> {:help}
    end
  end

  def process_args({:encrypt, string, shift}) when is_binary(string) and is_integer(shift) do
    IO.puts Caesar.Cipher.encrypt(string, shift)
  end

  def process_args({:help}) do
    IO.puts """
    usage: ./caesar <command> <message> --shift <shift_number>
    """
  end

  def help(:help) do

  end
end
