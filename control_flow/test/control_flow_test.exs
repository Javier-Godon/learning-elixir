defmodule ControlFlowTest do
  use ExUnit.Case
  doctest ControlFlow

  test "greets the world" do
    assert ControlFlow.hello() == :world
  end
end
