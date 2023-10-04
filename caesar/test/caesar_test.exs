defmodule CaesarTest do
  use ExUnit.Case
  doctest Caesar

  test "parse_args help" do
    argv = ["help"]
    assert Caesar.parse_args(argv) === {:help}
  end

  test "parse_args encrypt" do
    argv = ["encrypt", "abcd", "--shift", "5"]
    assert Caesar.parse_args(argv) === {:encrypt, "abcd", 5}
  end


  test "hello" do
    assert 1 === 1
  end
end
