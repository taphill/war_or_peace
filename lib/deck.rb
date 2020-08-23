# frozen_string_literal: true

# Class to create a deck filled with cards.
# Cards can be added or removed from the deck and rank of card can be determined.
class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
    @high_ranking_cards = []
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    update_high_ranking_cards
    @high_ranking_cards
  end

  def percent_high_ranking
    update_high_ranking_cards
    ((@high_ranking_cards.size / @cards.size).to_f * 100.0).round(2)
  end

  def remove_card
    @high_ranking_cards.shift
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

  def size
    @cards.length
  end

  private

  def update_high_ranking_cards
    cards.each do |card|
      if card.rank >= 11 && @high_ranking_cards.include?(card) == false
        @high_ranking_cards << card
      end
    end
  end
end
