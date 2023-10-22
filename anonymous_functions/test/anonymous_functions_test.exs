defmodule AnonymousFunctionsTest do
  use ExUnit.Case
  doctest AnonymousFunctions

  test "greets the world" do
    assert AnonymousFunctions.hello() == :world
  end
end
