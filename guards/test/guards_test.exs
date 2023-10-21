defmodule GuardsTest do
  use ExUnit.Case
  doctest Guards

  test "greets the world" do
    assert Guards.hello() == :world
  end
end
