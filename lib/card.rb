# frozen_string_literal: true

# Creates a playing card with a suit, value and rank
class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
