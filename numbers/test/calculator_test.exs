defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "find 10% of 150 = 15" do
    assert Calculator.find_percentage_of_value(150, 10) == 15
  end

  test "find 10% of 150 = 15 with pipe",
    do: assert(Calculator.find_percentage_of_value_with_pipe(150, 10) == 15)

  test "find distance traveled rounded traveling at 125km/h for 2 hours = 250 km",
    do: assert(Calculator.find_distance_traveled_rounded(125, 2)) == 250
end
