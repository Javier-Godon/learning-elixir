defmodule AnonymousFunctions do
  @moduledoc """
  Documentation for `AnonymousFunctions`.
  """
  def get_equipment_list do
    [:space_helmet, :space_suite, :snacks, :grappling_hook, :probe]
  end

  def item_details(:space_helmet) do
    {3, :kg, 1}
  end

  def item_details(:space_suite) do
    {16, :kg, 1}
  end

  def item_details(:snacks) do
    {1, :kg, 16}
  end

  def item_details(:grappling_hook) do
    {4, :kg, 1}
  end

  def item_details(:probe) do
    {2, :kg, 1}
  end

  def get_first_item(list) do
    first = fn [head | _tail] -> head end
    first.(list)
  end

  def get_weight_lbs(list) do
    get_lbs = fn item ->
      {wt, type, _qty} = item_details(item)
      case type do
        :kg -> wt * 2.2
        _ -> wt
      end
    end

    Enum.map(list, get_lbs)
  end

  def atom_to_string(list) do
    convert = fn x ->
      to_string(x)
      |> String.upcase()
      |> String.replace("_", " ")
    end

    Enum.map(list, convert)
  end
end
