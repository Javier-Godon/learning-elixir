defmodule Cards do
  '''
  a comprehension is inherently a map -> It is a mapping function
  a list in Elixir is a Linked List
  []: List
  {}: Tuple
  '''
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    cards = for value <- values do
      for suit <- suits do
        "#{value} of #{suit}"
      end
    end
    List.flatten(cards)
  end

  def create_deck_improved do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck), do: Enum.shuffle(deck)

  def contains?(deck, hand), do: Enum.member?(deck, hand)

  def deal(deck, hand_size), do: Enum.split(deck, hand_size)

'''
pattern matching is the Elixir replacement to variable assignment
variable = 5 is the simplest way of pattern matching
pattern matching happens anytime I use =
'''
  def deal_and_return_the_hand(deck, hand_size) do
    {hand, _rest_of_deck}=Enum.split(deck, hand_size)
    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def read(filename) do
    {_status,binary} = File.read(filename)
   :erlang.binary_to_term(binary)
  end

  def read_with_error_handling(filename) do
    {status,binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "that file does not exist"
    end
  end

  def read_improved(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "that file does not exist. Reason: #{reason}"
    end
  end

end



