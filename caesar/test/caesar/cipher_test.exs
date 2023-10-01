defmodule Caesar.CipherTest do
  use ExUnit.Case
  doctest Caesar.Cipher

  import Caesar.Cipher

  test "Simple encrypt shift right" do
    assert encrypt("abcd", 1) === "zabc"
  end

  test "Simple encrypt shift left" do
    assert encrypt("abcd", -1) === "bcde"
  end

  test "Encrypt handles capital letters" do
    assert encrypt("AbCd", 1) === "ZaBc"
  end

  test "Encrypt messages with spaces" do
    assert encrypt("Hello World!", -10) === "Rovvy Gybvn!"
  end

  test "Encrypt handles large shift number right" do
    assert encrypt("abcd", 27) === "zabc"
  end

  test "Encrypt handles large shift number left" do
    assert encrypt("abcd", -27) === "bcde"
  end

end
