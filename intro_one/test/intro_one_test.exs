defmodule IntroOneTest do
  use ExUnit.Case
  doctest IntroOne

  test "greets the world" do
    assert IntroOne.hello() == :world
  end
end
