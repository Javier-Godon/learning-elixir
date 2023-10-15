defmodule Strings do
  @moduledoc """
  Documentation for `Strings`.
  """
  def trim_string(value) do
    String.trim(value)
  end

  def first_letter(value), do: String.trim(value) |> String.first()

  def capitalize_first_letter(value), do: first_letter(value) |> String.capitalize()

  def capitalize_initials(full_name),
    do:
      String.split(full_name, " ")
      |> Enum.map(fn name -> "#{capitalize_first_letter(name)}. " end)
      |> List.to_string()
      |> String.trim()

  def display_saucer(), do: IO.puts(build_saucer())

  defp build_saucer() do
    """

                        %%%%%%%%%%%%%%%%%%%%
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ************************************************************
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
           ,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,
                ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

    """
  end

  def display_custom_spacecraft(full_name), do: IO.puts(customized_spacecraft(full_name))

  defp customized_spacecraft(full_name) do
    spacecraft_label =
      "******************** #{capitalize_initials(full_name)}'s  SPACECRAFT *******************"

    "#{build_saucer()}"
    |> String.replace(
      "************************************************************",
      spacecraft_label
    )
  end
end
