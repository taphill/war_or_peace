require './lib/turn'

class StartGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 0
  end

  def start
    #intro
    #user_ready?
    turn
    # "*~*~*~* #{} has won the game! *~*~*~*"
  end

private

  def intro
    puts "\nWelcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{@player1.name} and #{@player2.name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
  end

  def user_ready?
    user_input = gets.chomp

    if user_input.upcase == 'GO'
      nil
    else
      puts "Type 'GO' if you're ready!"
    end
  end

  def turn
    until player_deck_empty? || @turn_number == 20
      turn = Turn.new(@player1, @player2)      
      @turn_number += 1
      turn.pile_cards
      turn.award_spoils
      print "\nTurn #{@turn_number}: "
      turn.turn_console_message
    end
  end

  def player_deck_empty?
    @player1.deck.cards.empty? || @player2.deck.cards.empty?
  end

end