# frozen_string_literal: true

# Create a Player with a name and deck
# Rank of Player cards can be determined a size of deck can be checked
class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def lost?
    @deck.cards.empty? ? true : false
  end

  def deck_size
    @deck.size
  end

  def card_at_0
    @deck.rank_of_card_at(0)
  end

  def card_at_2
    @deck.rank_of_card_at(2)
  end

  def remove_card_from_deck
    @deck.remove_card
  end
end
