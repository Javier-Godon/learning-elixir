defmodule Calculator do
  def find_percentage_of_value(value, percentage) do
    # value * (percentage / 100)
    dec_percent = BasicMath.divide(percentage, 100)
    BasicMath.multiply(value, dec_percent)
  end

  # with a pipe operator
  def find_percentage_of_value_with_pipe(value, percentage),
    do: percentage |> BasicMath.divide(100) |> BasicMath.multiply(value)

  def find_distance_traveled_rounded(speed, time) do
    speed |> BasicMath.multiply(time) |> ceil()
  end
end
