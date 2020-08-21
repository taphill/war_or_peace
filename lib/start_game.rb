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
    until player_lost? || @turn_number == 50_000
      turn = Turn.new(@player1, @player2)      
      @turn_number += 1
      turn.pile_cards
      print "\nTurn #{@turn_number}: "
      turn.turn_console_message
      turn.award_spoils
    end
  end

  def player_lost?
    @player1.has_lost? || @player2.has_lost?
  end

end