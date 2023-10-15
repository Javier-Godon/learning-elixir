defmodule LinkedLists do
  @moduledoc """
  Documentation for `LinkedLists`.
  """
  def get_equipment_list(),
    do: ["Space Helmet", "Space suit", "Snacks", "Graphling hook", "Probe"]

  def get_first_item(list), do: hd(list)
  def remove_first_item(list), do: tl(list)

  def add_slow(list, value), do: list ++ [value]

  def add_optimized(list, value) do
    list_reversed = Enum.reverse(list)
    new_list = [value | list_reversed]
    Enum.reverse(new_list)
  end

  def add_optimized_piped(list, value) do
    Enum.reverse(list) |> prepend(value) |> Enum.reverse()
  end

  defp prepend(list, value), do: [value | list]

  def add_fast(list, value) do
    [value | Enum.reverse(list)]
    |> Enum.reverse()
  end

  def remove_item(list, index), do: List.delete_at(list, index)

  def count_items(list) do
    length(list)
  end

  def check_for_item(list, item) do
    item in list
  end
end
