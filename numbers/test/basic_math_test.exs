defmodule BasicMathTest do
  use ExUnit.Case
  doctest BasicMath

  test "add 11 + 22 = 5" do
    assert BasicMath.add(11, 22) == 33
  end

  test "short add 47.25 + 32.17 = 79.42", do: assert(BasicMath.short_add(47.25, 32.17) == 79.42)

  test "substract 25 - 11 = 14", do: assert(BasicMath.substract(25, 11) == 14)

  test "multiply 75 * 10 = 750", do: assert(BasicMath.multiply(75, 10) == 750)

  test "divide 500:10 = 50" do
    assert BasicMath.divide(500, 10) == 50
  end

  test "round up 12.15 = 13", do: assert(BasicMath.round_up(12.15) == 12.16)
end
