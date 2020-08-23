require './lib/turn'

class StartGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 0
  end

  def start
    intro
    user_ready?
    who_won?
  end

private

  def intro
    puts "\nWelcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{@player1.name} and #{@player2.name}.
    Type 'GO' to start the game! Press 'q' to quit.
    ------------------------------------------------------------------"
  end

  def user_ready?
    user_input = gets.chomp
    
    until user_input.upcase == 'GO' || user_input.downcase == 'q'
      puts "Type 'GO' if you're ready! Press 'q' to quit."
      user_input = gets.chomp
    end

    return turn if user_input.upcase == 'GO'
    return puts "\nGoodbye." if user_input.downcase == 'q'
  end

  def turn
    until player_lost? || @turn_number == 1_000_000
      turn = Turn.new(@player1, @player2)      
      @turn_number += 1
      turn.pile_cards
      print "\nTurn #{@turn_number}: "
      turn.turn_console_message
      turn.award_spoils
    end
  end

  def who_won?
    if @player1.has_lost?
      puts "\n\n*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost?
      puts "\n\n*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    else
      puts "\n\n---- DRAW ----"
    end
  end

  def player_lost?
    @player1.has_lost? || @player2.has_lost?
  end

end