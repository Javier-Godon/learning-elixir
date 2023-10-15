defmodule SaucerPreflight do
  defp max_flying_load_lbs, do: 89
  defp convert_kg_to_lb(kg_value), do: kg_value * 2.205

  def extract_weight([]), do: 0

  # def extract_weight([head | tail]) do
  #   convert_kg_to_lb(
  #     elem(EquipmentDetails.item_details(head), 0) * elem(EquipmentDetails.item_details(head), 2)
  #   ) + extract_weight(tail)
  # end

  def extract_weight([head | tail]) do
    (head
     |> EquipmentDetails.item_details()
     |> elem(0)
     |> convert_kg_to_lb()) *
      (head
       |> EquipmentDetails.item_details()
       |> elem(2)) + extract_weight(tail)
  end

  def is_under_max_load?(list) do
    extract_weight(list) < max_flying_load_lbs()
  end

  def get_flying_load_lbs(list) do
    extract_weight(list)
  end
end
