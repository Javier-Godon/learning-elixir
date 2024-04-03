defmodule Identicon do
 def main(input) do
   input
   |> hash_input_md5
   |> pick_color
   |> build_grid
   |> filter_odd_squares
   |> build_pixel_map
   |> draw_image
   |> save_image(input)

 end

 def hash_input_sha256(input), do: :crypto.hash(:sha256,input) |> :binary.bin_to_list

 def hash_input_md5(input) do
   hex = :crypto.hash(:md5, input) |> :binary.bin_to_list
   %Identicon.Image{hex: hex}
 end

 def pick_color(%Identicon.Image{hex: [red, green, blue | _tail]} = identicon_image) do
   %Identicon.Image{identicon_image | color: {red,green,blue} }
 end

 def build_grid(%Identicon.Image{hex: hex} =identicon_image) do
   grid =
     hex
     |> Enum.chunk_every(3, 3, :discard)
     |> Enum.map(&mirror_row/1)
     |> List.flatten
     |> Enum.with_index
   %Identicon.Image{identicon_image | grid: grid}
 end

 def mirror_row(row) do
   [first,second | _tail]=row
   row ++ [second, first]
 end

 def filter_odd_squares(%Identicon.Image{grid: grid} = identicon_image) do
   grid = Enum.filter grid, fn ({code, _index}) ->
     rem(code, 2) == 0
   end

   %Identicon.Image{identicon_image | grid: grid}
 end

 def build_pixel_map(%Identicon.Image{grid: grid} = identicon_image) do
   pixel_map = Enum.map grid, fn ({_code, index}) ->
     horizontal = rem(index, 5) * 50
     vertical = div(index, 5) * 50

     top_left = {horizontal, vertical}
     bottom_right = {horizontal + 50, vertical + 50}

     {top_left, bottom_right}
   end

   %Identicon.Image{identicon_image | pixel_map: pixel_map}
 end

 def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
   image = :egd.create(250,250)
   fill = :egd.color(color)

   Enum.each pixel_map, fn ({top_left, bottom_right}) ->
    :egd.filledRectangle(image,top_left,bottom_right,fill)
   end

   :egd.render(image)

 end

 def save_image(image, input), do: File.write("#{input}.png", image)

end
