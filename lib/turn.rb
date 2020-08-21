class Turn
  attr_reader :player1, :player2, :type, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @type = set_type
    @winner = set_winner
    @spoils_of_war = []
  end

  def set_type
    return :mutually_assured_destruction if mutually_assured_destruction?
    return :war if war?
    return :basic if basic?
  end

  def set_winner
    return "No Winner" if @type == :mutually_assured_destruction
    return war_winner if @type == :war
    return basic_winner if @type == :basic
  end

  def pile_cards
    return mutually_assured_destruction_pile if @type == :mutually_assured_destruction
    return war_pile if @type == :war
    return basic_pile if @type == :basic
  end

  def award_spoils
    return "No spoils to award" if @type == :mutually_assured_destruction

    @spoils_of_war.shuffle.each do |card|
      @winner.deck.add_card(card)
    end
  end

  def turn_console_message
    if @type == :basic
      print "#{@winner.name} "
    elsif @type == :war
      print "WAR - #{@winner.name} "
    elsif @type == :mutually_assured_destruction
      return print "*mutually assured destruction* 6 cards removed from play"
    else
      print "ERROR"
    end

    print "won #{@spoils_of_war.length} cards"

    print " ------- #{@player1.name} deck = #{@player1.deck_size} +++ #{@player2.name} deck = #{@player2.deck_size}"
  end

private

  def mutually_assured_destruction?
    return war? if @player1.deck_size < 3 || @player2.deck_size < 3
    war? && (@player1.card_at_2 == @player2.card_at_2)
  end

  def war?
    @player1.card_at_0 == @player2.card_at_0
  end

  def basic?
    @player1.card_at_0 != @player2.card_at_0
  end

  def war_winner
    if @player1.card_at_2 > @player2.card_at_2
      @player1
    else
      @player2
    end
  end

  def basic_winner
    if @player1.card_at_0 > @player2.card_at_0
      @player1
    else
      @player2
    end
  end

  def mutually_assured_destruction_pile
    3.times { @player1.remove_card_from_deck }
    3.times { @player2.remove_card_from_deck }
  end

  def war_pile
    3.times { @spoils_of_war << @player1.remove_card_from_deck }
    3.times { @spoils_of_war << @player2.remove_card_from_deck }
  end

  def basic_pile
    @spoils_of_war << @player1.remove_card_from_deck 
    @spoils_of_war << @player2.remove_card_from_deck
  end

end