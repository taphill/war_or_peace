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
    ((@high_ranking_cards.size.to_f / @cards.size.to_f) * 100.0).round(2)
  end

  def remove_card
    @high_ranking_cards.shift
    @cards.shift
  end

  def add_card(card)
    @cards << card
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