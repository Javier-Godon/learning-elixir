defmodule Maps do

  def create_map, do: %{primary: "red", secondary: "blue"}

  def copy_map(map) do
    Map.put(map, :primary, "green")
  end

  def extend_map(map) do
    %{map | primary: "blue"}
#    This will throw an error
#    %{map | tertiary: "green"}
  end

  def extend_map_with_new(map) do
    Map.put_new(map, :tertiary, "green")
  end


end
