require './lib/turn'
require 'pry'

class StartGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 0
  end

  def start
    #intro
    #get_input
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

  def get_input
    user_input = gets.chomp

    if user_input.upcase == 'GO'
      nil
    else
      puts "Type 'GO' if ypu're ready!"
    end
  end

  def player_deck_empty?
    @player1.deck.cards.empty? || @player2.deck.cards.empty?
  end

  def turn
    until player_deck_empty? || @turn_number == 20
      @turn_number += 1
      turn = Turn.new(@player1, @player2)
      turn.pile_cards
      turn_console_message(turn)
      turn.award_spoils(turn.winner) unless turn.winner == 'No Winner'
    end
  end
  
  def turn_console_message(turn)
    puts "Turn #{@turn_number}: #{turn.winner.name} won #{turn.spoils_of_war.length} #{turn.type}"
  end

end