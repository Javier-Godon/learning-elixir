defmodule StringsTest do
  use ExUnit.Case
  doctest Strings

  test "trim blanks before and after" do
    assert Strings.trim_string(" Javier ") == "Javier"
  end

  test "get first letter even with blanks before", do: assert Strings.first_letter(" javier") == "j"

  test "get first letter capitalized even with blanks before", do: assert Strings.capitalize_first_letter(" javier") == "J"

  test "get all initials capitalized", do: assert Strings.capitalize_initials("Javier Godón") == "J. G."
end
