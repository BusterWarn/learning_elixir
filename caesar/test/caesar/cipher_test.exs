defmodule Caesar.CipherTest do
  use ExUnit.Case
  doctest Caesar.Cipher

  test "greets the world" do
    assert Caesar.Cipher.hello() == :world
  end
end
