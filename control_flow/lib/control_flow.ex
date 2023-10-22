defmodule ControlFlow do
  @moduledoc """
  Documentation for `ControlFlow`.
  """

  def check_max_load(load) do
    # if load < 55, do: "Save to fly!", else: "Too heavy to fly!"
    unless load < 55, do: "Too heavy to fly!", else: "Save to fly!"
  end

  def check_fuel_level(percentage) do
    cond do
      percentage == 100 -> "Full tank"
      percentage > 75 -> "3/4 tank"
      percentage > 49 -> "1/2 tank"
      percentage > 24 -> "1/4 tank"
      percentage > 10 -> "you should consider refuel ASAP"
      true -> "empty tank"
    end
  end

  def error_code_check(code) do
    case code do
      200 -> :ok
      201 -> :created
      202 -> :accepted
      204 -> :no_content
      401 -> :unauthorized
      403 -> :forbidden
      404 -> :not_found
      n when is_integer(n) and n > 404 -> :error
      _ -> :unknown
    end
  end

  defp convert_lb_to_kg(lb_value), do: lb_value * 0.45359237

  def equipment_check(equipment_tuple) do
    case equipment_tuple do
      {weight, unit_type, quantity} when weight / quantity < 16 and unit_type == :kg ->
        :equipment_cleared

      {weight, unit_type, quantity} when unit_type == :lb ->
        if convert_lb_to_kg(weight) / quantity < 16, do: :equipment_cleared, else: :failed

      _ ->
        :unknown
    end
  end
end
