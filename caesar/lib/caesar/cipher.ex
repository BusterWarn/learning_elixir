defmodule Caesar.Cipher do
  @moduledoc """
  Documentation for `Caesar.Cipher`.
  """

  @doc """
  [Caesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher).

  ## Examples

      iex> Caesar.Cipher.encrypt("Hello World!", -10)
      "Rovvy Gybvn!"

  """

def encrypt(string, shift) when is_binary(string) and is_integer(shift) do
  # Convert msg to char_list
  string
    |> to_charlist()
  # Iterate over list apply shift mapping
    |> Enum.map(&shift_char(&1, shift))
  # Return list as binary string
    |> List.to_string
  end

  defp shift_char(char, shift) do
    case char do
      chr when chr in (?a..?z) -> calculate_mapping(?a, chr, shift)
      chr when chr in (?A..?Z) -> calculate_mapping(?A, chr, shift)
      chr -> chr
    end
  end

  @alphabet_size 26

  defp calculate_mapping(base_letter, char, shift) do
    # Find the ASCII integer of the char and normalize it
    # by subtracting the size of the alphabet.
    normalize = &(&1 - @alphabet_size)
    # Ensure shift number is within the alphabet size
    shift_num = rem(shift, @alphabet_size)
    # Calculate the shifted value
    base_letter + rem(char - normalize.(base_letter) - shift_num, @alphabet_size)

  end

end
