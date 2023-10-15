defmodule BasicMath do
  def add(addend_one, addend_two) do
    addend_one + addend_two
  end

  def short_add(addend_one, addend_two), do: addend_one + addend_two

  def substract(minuend, subtrahend), do: minuend - subtrahend

  def multiply(multiplier, multiplicand) do
    multiplier * multiplicand
  end

  def divide(dividend, divisor), do: dividend / divisor

  def round_up(value), do: Float.ceil(value,2)
end
