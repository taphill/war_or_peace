class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    return :mutually_assured_destruction if mutually_assured_destruction?
    return :war if war?
    return :basic if basic?
  end

  def winner
    return "No Winner" if mutually_assured_destruction?
    return war_winner if war?
    return basic_winner if basic?
  end

  def pile_cards
    return mutually_assured_destruction_pile if mutually_assured_destruction?
    return war_pile if war?
    return basic_pile if basic?
  end

  def award_spoils(winner_of_turn)
    return "No spoils to award" if @spoils_of_war.empty?

    @spoils_of_war.each do |card|
      winner_of_turn.deck.cards << card
    end
  end

private

  def mutually_assured_destruction?
    card1 = (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) 
    card3 = (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))

    card1 && card3
  end

  def war?
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
  end

  def basic?
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
  end

  def war_winner
    if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    else
      @player2
    end
  end

  def basic_winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def mutually_assured_destruction_pile
    3.times { @player1.deck.remove_card }
    3.times { @player2.deck.remove_card }
  end

  def war_pile
    3.times { @spoils_of_war << @player1.deck.remove_card }
    3.times { @spoils_of_war << @player2.deck.remove_card }
  end

  def basic_pile
    @spoils_of_war << @player1.deck.remove_card 
    @spoils_of_war << @player2.deck.remove_card
  end

end